import 'package:flutter_rickandmortyinfo/home/home_screen_view_model.dart';
import 'package:flutter_rickandmortyinfo/provider/network/character_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenViewModelProvider = ChangeNotifierProvider<HomeScreenViewModel>((ref) {
  final characterRepository = ref.read(characterRepositoryProvider);
  return HomeScreenViewModel(characterRepository: characterRepository);
});