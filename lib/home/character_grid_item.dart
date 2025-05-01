import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/details/detail_screen_view_model.dart';
import 'package:flutter_rickandmortyinfo/model/character_data.dart';
import 'package:flutter_rickandmortyinfo/navigation/routes.dart';
import 'package:flutter_rickandmortyinfo/provider/detail_screen_view_model_provider.dart';
import 'package:flutter_rickandmortyinfo/widgets/rick_and_morty_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CharacterGridItem extends ConsumerWidget {
  final CharacterData characterData;

  const CharacterGridItem({
    required this.characterData,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(detailScreenViewModelProvider); 
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          viewModel.handleEvent(SetSelectedCharacter(characterData)); // Pass the character data to the view model
          context.push(Routes.details.path); // Pass the character name to the details screen
        },
        child: Stack(
          children: [
            Hero(
              tag: characterData.id,
              child: RickAndMortyImage(
                imageUrl: characterData.imageUrl,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    child: Icon(Icons.error),
                  );
                },
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    characterData.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ]
        )
        // Couldn't use this because of the overflow error
        // child: Column(
        //   children: [
        //     SizedBox(
        //       height: 128,
        //       width: double.infinity,
        //       child: FadeInImage(
        //         placeholder: MemoryImage(kTransparentImage),
        //         image: NetworkImage(imageUrl),
        //         imageErrorBuilder: (context, error, stackTrace) {
        //           return const SizedBox(
        //             child: Icon(Icons.error),
        //           );
        //         },
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     const SizedBox(height: 4),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 4.0),
        //       child: Center(child: Text(name)),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
