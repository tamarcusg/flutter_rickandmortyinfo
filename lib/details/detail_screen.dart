import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/provider/detail_screen_view_model_provider.dart';
import 'package:flutter_rickandmortyinfo/widgets/rick_and_morty_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                '$title: ',
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

    if (selectedCharacter == null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text('Error'),
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          scrolledUnderElevation: 0.0,
        ),
        body: const Center(child: Text('No character selected')),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RickAndMortyImage(
              imageUrl: selectedCharacter.imageUrl,
              imageErrorBuilder: (context, error, stackTrace) {
                return const SizedBox(child: Icon(Icons.error));
              },
              fit: BoxFit.cover,
              height: 400,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            _detailRow(title: 'Species', value: selectedCharacter.species),
            _detailRow(title: 'Status', value: selectedCharacter.status),
            _detailRow(title: 'Origin', value: selectedCharacter.origin),
            if (selectedCharacter.type != null &&
                selectedCharacter.type!.trim().isNotEmpty)
              _detailRow(title: 'Type', value: selectedCharacter.type!),

            _detailRow(
              title: 'Created',
              value: selectedCharacter.formattedDate,
            ),
          ],
        ),
      ),
    );
  }
}
