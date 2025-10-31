import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_the_duck/components/duck_image.dart';
import 'package:what_the_duck/components/error_image.dart';
import 'package:what_the_duck/components/loading.dart';
import 'package:what_the_duck/components/quack_button.dart';
import 'package:what_the_duck/functions/quack.dart';
import 'package:what_the_duck/model/duck.dart';
import 'package:what_the_duck/providers/duck_page_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DuckPageState pageState = ref.watch(duckPageStateProvider);
    final Duck? duck = ref.watch(duckProvider);
    if (pageState == DuckPageState.initial) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(duckProvider.notifier).state = await quack(context, ref);
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(
        child: Builder(
          builder: (context) {
            switch (pageState) {
              case DuckPageState.error:
                return ErrorImage();
              case DuckPageState.loading:
                return const LoadingIndicator();
              case DuckPageState.loaded:
                if (duck == null) {
                  return ErrorImage();
                } else {
                  return DuckImage(imageUrl: duck.imageUrl);
                }
              case DuckPageState.initial:
                return const LoadingIndicator();
            }
          },
        ),
      ),

      bottomNavigationBar: QuackButton(),
    );
  }
}
