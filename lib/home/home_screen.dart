import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/home/home_screen_view_model.dart';
import 'package:flutter_rickandmortyinfo/provider/home_screen_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(homeScreenViewModelProvider).handleEvent(LoadCharacters());
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeScreenViewModelProvider);
    final uiState = viewModel.uiState;
    final characters = uiState.characters;
    Widget mainContent = ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text('Character ${characters[index].name}'));
      },
    );
    if (uiState.isLoading) {
      mainContent = const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: mainContent,
    );
  }
}
