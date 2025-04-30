import 'package:flutter_rickandmortyinfo/details/detail_screen_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final detailScreenViewModelProvider = Provider<DetailScreenViewModel>((ref) {
  return DetailScreenViewModel();
});