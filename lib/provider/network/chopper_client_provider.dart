import 'package:chopper/chopper.dart';
import 'package:flutter_rickandmortyinfo/network/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chopperClientProvider = Provider<ChopperClient>((ref) {
  return ChopperClient(
    baseUrl: Uri.parse('https://rickandmortyapi.com/api/'),
    services: [ApiService.create()], 
    converter: const JsonConverter(),
  );
});