// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_result_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResultInfo _$PageResultInfoFromJson(Map<String, dynamic> json) =>
    PageResultInfo(
      count: (json['count'] as num).toInt(),
      nextPage: json['next'] as String?,
      prevPage: json['prev'] as String?,
    );

Map<String, dynamic> _$PageResultInfoToJson(PageResultInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.nextPage,
      'prev': instance.prevPage,
    };
