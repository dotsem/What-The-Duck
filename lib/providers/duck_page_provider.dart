import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:what_the_duck/model/duck.dart';

enum DuckPageState { initial, loading, loaded, error }

final duckPageStateProvider = StateProvider<DuckPageState>((ref) => DuckPageState.initial);
final duckProvider = StateProvider<Duck?>((ref) => null);
