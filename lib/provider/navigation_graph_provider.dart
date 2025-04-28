import 'package:flutter_rickandmortyinfo/navigation/navigation_graph.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationGraphProvider = Provider<NavigationGraph>((ref) {
  return NavigationGraph();
});