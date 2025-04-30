import 'package:flutter_rickandmortyinfo/model/base_view_model.dart';
import 'package:flutter_rickandmortyinfo/model/character_data.dart';
import 'package:flutter_rickandmortyinfo/model/screen_event.dart';
import 'package:flutter_rickandmortyinfo/model/ui_state.dart';

class DetailScreenViewModel extends BaseViewModel {
  final DetailScreenUIState _uiState = DetailScreenUIState();
  DetailScreenUIState get uiState => _uiState;

  @override
  void handleEvent(ScreenEvent event) {
    switch (event) {
      case SetSelectedCharacter():
        _uiState.selectedCharacter = event.characterData;
        break;
      default:
        break;
    }
  }
}

class SetSelectedCharacter extends ScreenEvent {
  final CharacterData characterData;

  SetSelectedCharacter(this.characterData);
}

class DetailScreenUIState extends UiState {
  CharacterData? selectedCharacter;

  DetailScreenUIState({this.selectedCharacter});
}