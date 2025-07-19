import 'package:flutter/material.dart';


class ProductImagesWidget extends StatelessWidget {
  final List<String> images;
  const ProductImagesWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                images[index],
                height: 300,
                width: MediaQuery.of(context).size.width * 0.4,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Icon(Icons.broken_image, size: 100),
              ),
            ),
          );
        },
      ),
    );
  }
}
