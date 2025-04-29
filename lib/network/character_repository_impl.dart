import 'package:flutter_rickandmortyinfo/network/api_service.dart';
import 'package:flutter_rickandmortyinfo/network/character_repository.dart';
import 'package:flutter_rickandmortyinfo/network/model/page_result.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final ApiService apiService;

  const CharacterRepositoryImpl({required this.apiService});
  
  @override
  Future<ApiResult> getCharacters({String? searchString}) {
    return apiService.getCharacters(name: searchString).then((response) {
      if (response.isSuccessful) {
        final pageData = PageResult.fromJson(response.body).toPageData();
        return ApiResult(isSuccessful: true, data: pageData);
      } else {
        return const ApiResult(isSuccessful: false, data: null);
      }
    });
  }
  
  @override
  Future<ApiResult> getPage({required String pageUrl}) {
    return apiService.getPage(pageUrl: pageUrl).then((response) {
      if (response.isSuccessful) {
        final pageData = PageResult.fromJson(response.body).toPageData();
        return ApiResult(isSuccessful: true, data: pageData);
      } else {
        return const ApiResult(isSuccessful: false, data: null);
      }
    });
  }

  
}