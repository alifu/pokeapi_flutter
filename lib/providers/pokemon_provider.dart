// providers/pokemon_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/models/pokedex.dart';
import 'package:pokeapi_flutter/services//api_service.dart';

/// State model
class PokedexState {
  final List<Pokedex> pokemons;
  final bool isLoading;
  final bool hasError;
  final int offset;

  PokedexState({
    this.pokemons = const [],
    this.isLoading = false,
    this.hasError = false,
    this.offset = 0,
  });

  PokedexState copyWith({
    List<Pokedex>? pokemons,
    bool? isLoading,
    bool? hasError,
    int? offset,
  }) {
    return PokedexState(
      pokemons: pokemons ?? this.pokemons,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      offset: offset ?? this.offset,
    );
  }

  factory PokedexState.initial() => PokedexState();
}

/// Notifier
class PokedexNotifier extends StateNotifier<PokedexState> {
  final ApiService apiService;
  final int limit = 20;

  // PokedexNotifier(this.apiService) : super(PokedexState());

  PokedexNotifier(this.apiService) : super(PokedexState.initial()) {
    // 🚀 load immediately when provider is created
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, hasError: false);

    try {
      final newPokemons =
      await apiService.fetchPokedex(limit: limit, offset: state.offset);
      state = state.copyWith(
        pokemons: [...state.pokemons, ...newPokemons],
        offset: state.offset + limit,
        isLoading: false,
      );
    } catch (_) {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  void reset() {
    state = PokedexState();
  }
}

/// Provider
final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
final pokedexProvider =
StateNotifierProvider<PokedexNotifier, PokedexState>(
        (ref) => PokedexNotifier(ref.read(apiServiceProvider)));
