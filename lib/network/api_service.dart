import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  
  @GET(path: '/character')
  Future<Response> getCharacters({
    @Query('name') String? name,
  });

  @GET(path: '/character')
  Future<Response> getPage({required String pageUrl}) {
    final request = Request(
      'GET',
      Uri.parse(pageUrl),
      Uri.parse('https://rickandmortyapi.com/api/')
    );
    return client.send(request);
  }

  static ApiService create([ChopperClient? client]) => _$ApiService(client);
}