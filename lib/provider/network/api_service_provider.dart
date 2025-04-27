import 'package:flutter_rickandmortyinfo/network/api_service.dart';
import 'package:flutter_rickandmortyinfo/provider/network/chopper_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final chopperClient = ref.watch(chopperClientProvider);
  return ApiService.create(chopperClient);
});