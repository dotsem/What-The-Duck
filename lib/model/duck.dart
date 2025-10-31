import 'dart:convert';

import 'package:what_the_duck/api.dart';
import 'package:http/http.dart' as http;

class Duck {
  final String imageUrl;

  Duck({required this.imageUrl});

  factory Duck.fromJson(Map<String, dynamic> json) {
    return Duck(imageUrl: json['url']);
  }
}

Future<Duck?> fetchRandomDuck() async {
  final response = await http.get(Uri.parse(randomDuckImageEndUrl));

  if (response.statusCode == 200) {
    return Duck.fromJson(json.decode(response.body));
  } else {
    return null;
  }
}
