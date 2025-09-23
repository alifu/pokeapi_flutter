import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/services/pokemon_navigator.dart';
import 'package:pokeapi_flutter/models/pokedex.dart';

final pokemonNavigatorProvider =
    StateNotifierProvider.family<
      PokemonNavigator,
      Pokedex?,
      (List<Pokedex>, int)
    >((ref, args) {
      final (results, startIndex) = args;
      return PokemonNavigator(allResults: results, startIndex: startIndex);
    });
