import 'package:flutter_rickandmortyinfo/network/character_repository.dart';
import 'package:flutter_rickandmortyinfo/network/character_repository_impl.dart';
import 'package:flutter_rickandmortyinfo/provider/network/api_service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final characterRepositoryProvider = Provider<CharacterRepository>((ref) {
  final apiService = ref.read(apiServiceProvider);
  return CharacterRepositoryImpl(apiService: apiService);
});