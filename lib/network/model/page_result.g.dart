// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResult _$PageResultFromJson(Map<String, dynamic> json) => PageResult(
  info: PageResultInfo.fromJson(json['info'] as Map<String, dynamic>),
  characters:
      (json['results'] as List<dynamic>)
          .map((e) => PageResultCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PageResultToJson(PageResult instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.characters};
