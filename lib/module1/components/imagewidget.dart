import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageWidget extends StatelessWidget {
  String url;
  double height;
  double width;
  double radius;
  BoxFit? fit;
  ImageWidget({
    Key? key,
    required this.url,
    required this.height,
    required this.width,
    required this.radius,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0),
                borderRadius: BorderRadius.all(Radius.circular(radius))),
            child: CachedNetworkImage(
              height: height,
              width: width,
              fit: fit,
              imageUrl: url,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: SizedBox(
                    height: 30,
                    width: 40,
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress, color: Colors.red),
                  ),
                );
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )));
  }
}
