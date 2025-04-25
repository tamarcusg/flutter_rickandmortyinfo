import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  
  @GET(path: '/character')
  Future<Response> getCharacters({
    @Query('name') String? name,
  });

  @GET(path: '/character')
  Future<Response> getPage({
    @Query('page') String? page,
  });

  static ApiService create([ChopperClient? client]) => _$ApiService(client);
}