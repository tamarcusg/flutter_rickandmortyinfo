import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/provider/detail_screen_view_model_provider.dart';
import 'package:flutter_rickandmortyinfo/widgets/rick_and_morty_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key});

  Widget _detailRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$title:',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(value),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(height: 1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailScreenViewModel = ref.read(detailScreenViewModelProvider);
    final selectedCharacter = detailScreenViewModel.uiState.selectedCharacter;
    final l10n = AppLocalizations.of(context)!;

    final deviceWidth = MediaQuery.of(context).size.width;
    final imageDimen = math.min(deviceWidth, 500.0);

    if (selectedCharacter == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          scrolledUnderElevation: 0.0,
        ),
        body: Center(child: Text(l10n.detail_screen_error_message)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(selectedCharacter.name),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        scrolledUnderElevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: selectedCharacter.id,
              child: RickAndMortyImage(
                imageUrl: selectedCharacter.imageUrl,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const SizedBox(child: Icon(Icons.error));
                },
                fit: BoxFit.cover,
                height: imageDimen,
                width: imageDimen,
              ),
            ),
            const SizedBox(height: 16),
            _detailRow(title: l10n.species_title, value: selectedCharacter.species),
            _detailRow(title: l10n.status_title, value: selectedCharacter.status),
            _detailRow(title: l10n.origin_title, value: selectedCharacter.origin),
            if (selectedCharacter.type != null &&
                selectedCharacter.type!.trim().isNotEmpty)
              _detailRow(title: l10n.type_title, value: selectedCharacter.type!),

            _detailRow(
              title: l10n.date_created_title,
              value: selectedCharacter.formattedDate,
            ),
          ],
        ),
      ),
    );
  }
}
