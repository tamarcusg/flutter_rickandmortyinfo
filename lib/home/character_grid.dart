import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/home/character_grid_item.dart';
import 'package:flutter_rickandmortyinfo/home/home_screen_view_model.dart';
import 'package:flutter_rickandmortyinfo/provider/home_screen_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterGrid extends ConsumerStatefulWidget {
  const CharacterGrid({super.key});

  @override
  ConsumerState<CharacterGrid> createState() => _CharacterGridState();
}

class _CharacterGridState extends ConsumerState<CharacterGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(homeScreenViewModelProvider).handleEvent(LoadCharacters());
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        ref.read(homeScreenViewModelProvider).handleEvent(LoadNextPage());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeScreenViewModelProvider);
    final uiState = viewModel.uiState;
    final characters = uiState.characters;
    return Expanded(
      child: Stack(
        children: [
          GridView(
            controller: _scrollController,
            padding: const EdgeInsets.all(24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: 0.7,
            ),
            shrinkWrap: false,
            children:
                characters
                    .map(
                      (character) => CharacterGridItem(
                        characterData: character,
                      ),
                    )
                    .toList(),
          ),
          if (uiState.isLoading)
              const Positioned.fill(
                child: Center(child: CircularProgressIndicator()),
              ),
        ],
      ),
    );
  }
}
