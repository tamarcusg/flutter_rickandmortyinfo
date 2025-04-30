import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class RickAndMortyImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget Function(BuildContext, Object, StackTrace?)? imageErrorBuilder;

  const RickAndMortyImage({
    super.key,
    required this.imageUrl,
    this.imageErrorBuilder,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: MemoryImage(kTransparentImage),
      image: NetworkImage(imageUrl),
      imageErrorBuilder: imageErrorBuilder,
      fit: fit,
      width: width,
      height: height,
    );
  }
}