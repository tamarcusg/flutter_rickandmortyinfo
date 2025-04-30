import 'package:flutter_rickandmortyinfo/details/detail_screen.dart';
import 'package:flutter_rickandmortyinfo/home/home_screen.dart';
import 'package:flutter_rickandmortyinfo/navigation/routes.dart';
import 'package:go_router/go_router.dart';

class NavigationGraph {
  final goRouter = GoRouter(
    initialLocation: Routes.home.path,
    routes: [
      GoRoute(
        path: Routes.home.path,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: Routes.details.path,
        builder: (context, state) => const DetailScreen(),
      )
    ]
  );
}