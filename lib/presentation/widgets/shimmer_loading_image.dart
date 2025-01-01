import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const ShimmerLoadingImage({
    required this.imageUrl,
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _precacheImage(context, imageUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[800]!,
              highlightColor: Colors.grey[700]!,
              child: Container(
                width: width,
                height: height,
                color: Colors.grey,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _precacheImage(BuildContext context, String url) async {
    final image = NetworkImage(url);
    await precacheImage(image, context);
  }
}
