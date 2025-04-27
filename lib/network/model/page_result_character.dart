import 'package:flutter_rickandmortyinfo/model/character_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_result_character.g.dart';

@JsonSerializable()
class PageResultCharacter {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'image')
  final String image;
  @JsonKey(name: 'species')
  final String species;
  @JsonKey(name: 'status')
  final String status;
   @JsonKey(name: 'origin')
  final PageResultCharacterOrigin origin;
  @JsonKey(name: 'type')
  final String? type;
   @JsonKey(name: 'created')
  final String createdDate;

  PageResultCharacter({
    required this.id,
    required this.name,
    required this.image,
    required this.species,
    required this.status,
    required this.origin,
    this.type,
    required this.createdDate,
  });

  factory PageResultCharacter.fromJson(Map<String, dynamic> json) =>
      _$PageResultCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$PageResultCharacterToJson(this);

  CharacterData toCharacterData() {
    return CharacterData(
      id: id,
      name: name,
      imageUrl: image,
      species: species,
      status: status,
      origin: origin.name,
      type: type,
      createdDate: createdDate,
    );
  }
}

@JsonSerializable()
  class PageResultCharacterOrigin {
    @JsonKey(name: 'name')
    final String name;

    PageResultCharacterOrigin({
      required this.name,
    });

    factory PageResultCharacterOrigin.fromJson(Map<String, dynamic> json) =>
        _$PageResultCharacterOriginFromJson(json);
    Map<String, dynamic> toJson() => _$PageResultCharacterOriginToJson(this);
  }