import 'package:json_annotation/json_annotation.dart';

part 'page_result_info.g.dart';

@JsonSerializable()
class PageResultInfo {
  @JsonKey(name: 'count')
  final int count;
  @JsonKey(name: 'next')
  final String? nextPage;
  @JsonKey(name: 'prev')
  final String? prevPage;

  PageResultInfo({
    required this.count,
    this.nextPage,
    this.prevPage,
  });

  factory PageResultInfo.fromJson(Map<String, dynamic> json) =>
      _$PageResultInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PageResultInfoToJson(this);
}