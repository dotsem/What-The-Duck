import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:what_the_duck/model/duck.dart';
import 'package:what_the_duck/providers/duck_page_provider.dart';

Future<Duck?> quack(BuildContext context, WidgetRef ref) async {
  ref.read(duckPageStateProvider.notifier).state = DuckPageState.loading;
  final duck = await fetchRandomDuck();
  try {
    if (duck == null) {
      throw Exception('Failed to fetch duck');
    }
    if (context.mounted) {
      await precacheImage(NetworkImage(duck.imageUrl), context);
    } else {
      throw Exception('Context not mounted');
    }
  } on Exception {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Woopsie 0_0, something went quack!')),
      );
    }
    ref.read(duckPageStateProvider.notifier).state = DuckPageState.error;
    return null;
  }
  ref.read(duckPageStateProvider.notifier).state = DuckPageState.loaded;
  return duck;
}

const List<String> quackSounds = [
  'assets/audio/quack.wav',
  'assets/audio/quock.wav',
];
final List<AudioSource> duckPool = [];

Future<void> initDuckAudio() async {
  await SoLoud.instance.init();
  for (final sound in quackSounds) {
    final source = await SoLoud.instance.loadAsset(sound);
    duckPool.add(source);
  }
}

SoundHandle quackVerbally() {
  final quackSound = Random().nextInt(duckPool.length);
  return SoLoud.instance.play(duckPool[quackSound]);
}
