import 'package:flutter/material.dart';
import 'package:flutter_rickandmortyinfo/navigation/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:transparent_image/transparent_image.dart';

class CharacterGridItem extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CharacterGridItem({
    required this.imageUrl,
    required this.name,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          context.go(Routes.details.path); // Pass the character name to the details screen
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage), 
              image: NetworkImage(imageUrl),
              imageErrorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  child: Icon(Icons.error),
                );
              },
              fit: BoxFit.cover,
              height: 180,
              width: double.infinity,
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
                    name,
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
