import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_the_duck/functions/quack.dart';
import 'package:what_the_duck/screens/duck_page.dart';
import 'package:what_the_duck/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDuckAudio();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const CounterPage());
  }
}
