import 'package:flutter/material.dart';

class DuckImage extends StatelessWidget {
  const new({required this.imageUrl, super.key});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
