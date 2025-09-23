import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/models/pokemon.dart';
import 'package:pokeapi_flutter/services/api_service.dart';

/// Provide ApiService instance
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

/// Pokémon detail + species provider
final pokemonProvider = FutureProvider.autoDispose.family<Pokemon, String>((
  ref,
  name,
) async {
  final api = ref.read(apiServiceProvider);
  return api.fetchPokemon(name);
});
