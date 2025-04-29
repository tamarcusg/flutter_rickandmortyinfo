import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/home/character_grid.dart';
import 'package:flutter_rickandmortyinfo/home/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector( //This closes the keyboard when tapping outside the text field
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.home_screen_app_bar_title),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          scrolledUnderElevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16),
                color: Theme.of(context).colorScheme.surfaceContainer,
                child: Column(
                  children: [
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: const RickAndMortySearchBar(),
                      ),
                    ),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
              
              const Divider(height: 1),
              const CharacterGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
