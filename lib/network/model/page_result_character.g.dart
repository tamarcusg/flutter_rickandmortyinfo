// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_result_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResultCharacter _$PageResultCharacterFromJson(Map<String, dynamic> json) =>
    PageResultCharacter(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      species: json['species'] as String,
      status: json['status'] as String,
      origin: PageResultCharacterOrigin.fromJson(
        json['origin'] as Map<String, dynamic>,
      ),
      type: json['type'] as String?,
      createdDate: json['created'] as String,
    );

Map<String, dynamic> _$PageResultCharacterToJson(
  PageResultCharacter instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'species': instance.species,
  'status': instance.status,
  'origin': instance.origin,
  'type': instance.type,
  'created': instance.createdDate,
};

PageResultCharacterOrigin _$PageResultCharacterOriginFromJson(
  Map<String, dynamic> json,
) => PageResultCharacterOrigin(name: json['name'] as String);

Map<String, dynamic> _$PageResultCharacterOriginToJson(
  PageResultCharacterOrigin instance,
) => <String, dynamic>{'name': instance.name};
