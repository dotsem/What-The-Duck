import 'package:flutter/material.dart';

class DuckImage extends StatelessWidget {
  final String imageUrl;
  const DuckImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
