import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/model/base_view_model.dart';
import 'package:flutter_rickandmortyinfo/model/character_data.dart';
import 'package:flutter_rickandmortyinfo/model/page_data.dart';
import 'package:flutter_rickandmortyinfo/model/screen_event.dart';
import 'package:flutter_rickandmortyinfo/model/ui_state.dart';
import 'package:flutter_rickandmortyinfo/network/character_repository.dart';
import 'package:flutter_rickandmortyinfo/network/model/debouncer.dart';

class HomeScreenViewModel extends ChangeNotifier implements BaseViewModel {
  final CharacterRepository characterRepository;
  HomeScreenViewModel({required this.characterRepository});

  final HomeScreenUIState _uiState = HomeScreenUIState();
  HomeScreenUIState get uiState => _uiState;

  final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  @override
  void handleEvent(ScreenEvent event) {
    switch (event) {
      case UpdateSearchString():
        _debouncer(() =>_searchCharacters(event.searchString)); 
        break;
      case LoadCharacters():
        _loadCharacters();
        break;
      case LoadNextPage():
        _loadNextPage();
        break;
    }
  }

  void _searchCharacters(String searchString) async {
    _uiState.searchString = searchString;

    await characterRepository.getCharacters(searchString: searchString).then((ApiResult result) {
      if (result.isSuccessful) {
        updateStatePageData(pageData: result.data as PageData);
        notifyListeners();
      } else {
        _uiState.isLoading = false;
        notifyListeners();
      }
    });
  }

  void _loadCharacters() async {
    _uiState.isLoading = true;
    notifyListeners();

    await characterRepository.getCharacters().then((ApiResult result) {
      if (result.isSuccessful) {
        updateStatePageData(pageData: result.data as PageData);
        notifyListeners();
      } else {
        _uiState.isLoading = false;
        notifyListeners();
      }
    });
  }

  void _loadNextPage() async {
    if (_uiState.nextPageUrl == null) return;

    _uiState.isLoading = true;
    notifyListeners();

    await characterRepository.getPage(pageUrl: _uiState.nextPageUrl!).then((ApiResult result) {
      if (result.isSuccessful) {
        var pageData = result.data as PageData;
        pageData = pageData.copy(
          characters: [..._uiState.characters, ...pageData.characters],
        );
        updateStatePageData(pageData: pageData);
        notifyListeners();
      } else {
        _uiState.isLoading = false;
        notifyListeners();
      }
    });
  }

  void updateStatePageData({required PageData pageData}) {
    _uiState.characters = pageData.characters;
    _uiState.resultCount = pageData.count;
    _uiState.nextPageUrl = pageData.nextPage;
    _uiState.isLoading = false;
  }
}

class UpdateSearchString extends ScreenEvent {
  final String searchString;

  UpdateSearchString(this.searchString);
}

class LoadCharacters extends ScreenEvent {}

class LoadNextPage extends ScreenEvent {}

class HomeScreenUIState extends UiState {
  String searchString;
  List<CharacterData> characters;
  bool isLoading;
  String? nextPageUrl;
  int resultCount;
  bool disableSearchBar;

  HomeScreenUIState({
    this.searchString = "",
    this.characters = const [],
    this.isLoading = false,
    this.nextPageUrl,
    this.resultCount = 0,
    this.disableSearchBar = false,
  });
}