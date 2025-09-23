import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/models/pokedex.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Navigator as a StateNotifier
class PokemonNavigator extends StateNotifier<Pokedex?> {
  final List<Pokedex> allResults;

  PokemonNavigator({required this.allResults, int startIndex = 0})
    : super(
        allResults.isNotEmpty && startIndex < allResults.length
            ? allResults[startIndex]
            : null,
      );

  void moveNext() {
    if (state == null) return;
    final index = allResults.indexWhere((e) => e.id == state!.id);
    if (index != -1 && index + 1 < allResults.length) {
      state = allResults[index + 1];
    }
  }

  void movePrevious() {
    if (state == null) return;
    final index = allResults.indexWhere((e) => e.id == state!.id);
    if (index > 0) {
      state = allResults[index - 1];
    }
  }
}
