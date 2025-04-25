import 'package:json_annotation/json_annotation.dart';

part 'page_result_character.g.dart';

@JsonSerializable()
class PageResultCharacter {
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
  final String origin;
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
}