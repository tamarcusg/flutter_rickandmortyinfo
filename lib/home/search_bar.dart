import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rickandmortyinfo/home/home_screen_view_model.dart';
import 'package:flutter_rickandmortyinfo/provider/home_screen_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RickAndMortySearchBar extends ConsumerStatefulWidget {
  
  const RickAndMortySearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RickAndMortySearchBarState();
}

class _RickAndMortySearchBarState extends ConsumerState<RickAndMortySearchBar> {
  final TextEditingController _controller = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeScreenViewModelProvider);
    return SearchBar(
      controller: _controller,
      focusNode: _focusNode,
      backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceBright),
      hintText: AppLocalizations.of(context)!.search_bar_hint,
      elevation: const WidgetStatePropertyAll(2),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.only(left: 8),
      ),
      trailing: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
            viewModel.handleEvent(UpdateSearchString(''));
          },
        ),
      ],
      onChanged: (value) {
        viewModel.handleEvent(UpdateSearchString(value));
      },
    );
  }
}
