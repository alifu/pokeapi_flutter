import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/providers/pokemon_provider.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/widget/pokedex_header.dart';
import 'package:pokeapi_flutter/widget/pokemon_card.dart';
import 'package:pokeapi_flutter/widget/search_box.dart';
import 'package:pokeapi_flutter/widget/sort_button.dart';

import '../utils/font_utils.dart';

class PokedexScreen extends ConsumerStatefulWidget {
  const PokedexScreen({super.key});

  @override
  ConsumerState<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends ConsumerState<PokedexScreen> {
  @override
  void initState() {
    super.initState();
    // Initial load
    Future.microtask(() {
      ref.read(pokedexProvider.notifier).loadPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(pokedexProvider);

    if (state.isLoading && state.pokemons.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.hasError && state.pokemons.isEmpty) {
      return const Scaffold(
        body: Center(child: Text('Error loading data')),
      );
    }

    return Scaffold(
      backgroundColor: ColorUtils.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16),
              child: PokedexHeader(),
            ),

            // Search & Sort row
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Row(
                children: <Widget>[
                  Expanded(child: SizedBox(height: 40, child: SearchBox())),
                  const SizedBox(width: 8),
                  const SizedBox(width: 40, height: 40, child: SortButton()),
                ],
              ),
            ),

            // Pokémon list
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 🔹 3 columns
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1, // 🔹 adjust height vs width
                    ),
                    itemCount: state.pokemons.length + 1,
                    itemBuilder: (context, index) {
                      if (index == state.pokemons.length) {
                        // 🔥 Load more
                        if (!state.isLoading) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ref.read(pokedexProvider.notifier).loadPokemons();
                          });
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final pokemon = state.pokemons[index];
                      return PokemonCard(
                        id: pokemon.id,
                        name: pokemon.name,
                        imageUrl: pokemon.imageUrl,
                        onTap: () {
                          // 🔹 navigate to detail screen later
                          print("Tapped on ${pokemon.name}");
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
