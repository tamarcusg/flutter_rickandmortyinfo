import 'package:flutter_rickandmortyinfo/model/page_data.dart';
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

  factory PageResult.fromJson(Map<String, dynamic> json) =>
      _$PageResultFromJson(json);

  Map<String, dynamic> toJson() => _$PageResultToJson(this);

  PageData toPageData() {
    return PageData(
      count: info.count,
      nextPage: info.nextPage,
      characters: characters.map((e) => e.toCharacterData()).toList(),
    );
  }
}



