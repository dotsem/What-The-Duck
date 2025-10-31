import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_the_duck/model/duck.dart';
import 'package:what_the_duck/providers/duck_page_provider.dart';

Future<Duck?> quack(BuildContext context, WidgetRef ref) async {
  ref.read(duckPageStateProvider.notifier).state = DuckPageState.loading;
  final duck = await fetchRandomDuck();
  try {
    if (duck == null) {
      throw Exception('Failed to fetch duck');
    }
    await precacheImage(NetworkImage(duck.imageUrl), context);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Woopsie 0_0, something went quack!')));
    ref.read(duckPageStateProvider.notifier).state = DuckPageState.error;
    return null;
  }
  ref.read(duckPageStateProvider.notifier).state = DuckPageState.loaded;
  return duck;
}
