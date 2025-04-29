import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/home/character_grid.dart';
import 'package:flutter_rickandmortyinfo/home/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.home_screen_app_bar_title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const RickAndMortySearchBar(),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            const CharacterGrid(),
          ],
        ),
      ),
    );
  }
}
