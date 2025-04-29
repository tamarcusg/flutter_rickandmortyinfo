import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/home/character_grid_item.dart';
import 'package:flutter_rickandmortyinfo/home/home_screen_view_model.dart';
import 'package:flutter_rickandmortyinfo/home/search_bar.dart';
import 'package:flutter_rickandmortyinfo/model/character_data.dart';
import 'package:flutter_rickandmortyinfo/provider/home_screen_view_model_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(homeScreenViewModelProvider).handleEvent(LoadCharacters());
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
    final l10n = AppLocalizations.of(context)!;
    final characters = uiState.characters;
    //final characters = _fakeCharacters;

    Widget mainContent = Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: [
          Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSearchBar(
              uiState.searchString,
              (searchString) {
                viewModel.handleEvent(UpdateSearchString(searchString));
              },
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            _buildCharacterGrid(characters),
          ],
        ),
        if (uiState.isLoading) 
          const Positioned.fill(
            child: Center(child: CircularProgressIndicator()),
          ),
        
        ]
      ),
    );

    if (uiState.isLoading) {
      mainContent = const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: Text(l10n.home_screen_app_bar_title)),
      body: mainContent,
    );
  }

  Widget _buildSearchBar(String searchString, Function(String) onSearchChanged) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: RickAndMortySearchBar(
          searchString: searchString,
          onSearchChanged: (text) {
            onSearchChanged(text);
            _scrollController.jumpTo(0);
          },
        ),
      ),
    );
  }

  Widget _buildCharacterGrid(List<CharacterData> characters) {
    return Expanded(
      child: GridView(
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
                    imageUrl: character.imageUrl,
                    name: character.name,
                  ),
                )
                .toList(),
      ),
    );
  }
}

final _fakeCharacters = const [
  CharacterData(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    imageUrl: 'https://rickandmortyapi.com/api/character/avatar/361.jpeg',
    origin: 'Earth',
    type: '',
    createdDate: '2017-11-04T18:50:21.651Z',
  ),
  CharacterData(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    imageUrl: '',
    origin: 'Earth',
    type: '',
    createdDate: '2017-11-04T18:50:21.651Z',
  ),
  CharacterData(
    id: 1,
    name: 'Morty Smith',
    status: 'Alive',
    species: 'Human',
    imageUrl: '',
    origin: 'Earth',
    type: '',
    createdDate: '2017-11-04T18:50:21.651Z',
  ),
  CharacterData(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    imageUrl: '',
    origin: 'Earth',
    type: '',
    createdDate: '2017-11-04T18:50:21.651Z',
  ),
  CharacterData(
    id: 1,
    name: 'Rick Sanchez',
    status: 'Alive',
    species: 'Human',
    imageUrl: '',
    origin: 'Earth',
    type: '',
    createdDate: '2017-11-04T18:50:21.651Z',
  ),
];
