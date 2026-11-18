import 'package:flutter/material.dart';

class DuckImage extends StatelessWidget {
  const DuckImage({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
