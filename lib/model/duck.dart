import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:what_the_duck/api.dart';

class Duck {
  Duck({required this.imageUrl});
  factory Duck.fromJson(Map<String, dynamic> json) {
    return Duck(imageUrl: json['url'] as String);
  }
  final String imageUrl;
}

Future<Duck?> fetchRandomDuck() async {
  final response = await http.get(Uri.parse(randomDuckImageEndUrl));

  if (response.statusCode == 200) {
    return Duck.fromJson(
      json.decode(response.body) as Map<String, dynamic>,
    );
  } else {
    return null;
  }
}
