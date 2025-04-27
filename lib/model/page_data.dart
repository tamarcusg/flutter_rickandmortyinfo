import 'package:flutter_rickandmortyinfo/model/character_data.dart';

class PageData {
  final int count;
  final String? nextPage;
  final List<CharacterData> characters;

  const PageData({
    required this.count,
    this.nextPage,
    required this.characters,
  });
}