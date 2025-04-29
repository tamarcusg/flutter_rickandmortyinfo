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

  PageData copy({
    int? count,
    String? nextPage,
    List<CharacterData>? characters,
  }) {
    return PageData(
      count: count ?? this.count,
      nextPage: nextPage ?? this.nextPage,
      characters: characters ?? this.characters,
    );
  }
}