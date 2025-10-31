import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_the_duck/functions/quack.dart';
import 'package:what_the_duck/providers/duck_page_provider.dart';

class QuackButton extends ConsumerWidget {
  const QuackButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DuckPageState pageState = ref.watch(duckPageStateProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 64,
        child: TweenAnimationBuilder<Color?>(
          tween: ColorTween(begin: Theme.of(context).colorScheme.primary, end: pageState == DuckPageState.loading ? Theme.of(context).colorScheme.secondary : Theme.of(context).colorScheme.primary),
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          builder: (context, color, child) {
            final bg = color ?? Theme.of(context).colorScheme.primary;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: bg, foregroundColor: Theme.of(context).colorScheme.onPrimary),
              onPressed: () async {
                if (pageState == DuckPageState.loading) return;
                ref.read(duckProvider.notifier).state = await quack(context, ref);
              },
              child: child,
            );
          },
          child: const Text('Quack!'),
        ),
      ),
    );
  }
}
