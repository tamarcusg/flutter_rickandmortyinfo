import 'package:flutter_rickandmortyinfo/network/model/page_result_character.dart';
import 'package:flutter_rickandmortyinfo/network/model/page_result_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_result.g.dart';

@JsonSerializable()
class PageResult {
  @JsonKey(name: 'info')
  final PageResultInfo info;
  @JsonKey(name: 'results')
  final List<PageResultCharacter> characters;

  PageResult({
    required this.info,
    required this.characters,
  });

  factory PageResult.fromJson(Map<String, dynamic> json) {
    return PageResult(
      info: PageResultInfo.fromJson(json['info']),
      characters: (json['results'] as List)
          .map((e) => PageResultCharacter.fromJson(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'info': info.toJson(),
      'results': characters.map((e) => e.toJson()).toList(),
    };
  }
}



