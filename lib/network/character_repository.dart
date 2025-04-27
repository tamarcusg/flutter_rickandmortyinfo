abstract class CharacterRepository {
  Future<ApiResult> getCharacters({String searchString});
  Future<ApiResult> getPage({required String pageUrl});
}

class ApiResult {
  final dynamic data;
  final bool isSuccessful;

  const ApiResult({required this.isSuccessful, required this.data});
}