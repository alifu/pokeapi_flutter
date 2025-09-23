import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/providers/pokemon_navigator_provider.dart';
import 'package:pokeapi_flutter/providers/pokemon_provider.dart';
import 'package:pokeapi_flutter/models/pokemon.dart';
import 'package:pokeapi_flutter/models/pokedex.dart';

/// Combines navigator + API
final currentPokemonProvider =
    FutureProvider.autoDispose.family<Pokemon?, (List<Pokedex>, int)>((ref, args) async {
      final current = ref.watch(pokemonNavigatorProvider(args));
      if (current == null) return null;

      // Use existing provider to fetch detail + species
      return await ref.watch(pokemonProvider(current.name).future);
    });
