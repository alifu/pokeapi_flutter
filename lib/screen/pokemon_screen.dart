import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/extension/num_extension.dart';
import 'package:pokeapi_flutter/providers/pokemon_navigator_provider.dart';
import 'package:pokeapi_flutter/providers/pokemon_provider.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/models/pokedex.dart';
import 'package:pokeapi_flutter/widget/ability_info.dart';
import 'package:pokeapi_flutter/widget/banner_pokemon.dart';
import 'package:pokeapi_flutter/widget/body_info.dart';
import 'package:pokeapi_flutter/widget/pokemon_header.dart';
import 'package:pokeapi_flutter/widget/stat_info.dart';

import '../providers/current_pokemon_provider.dart';
import '../utils/font_utils.dart';

class PokemonScreen extends ConsumerStatefulWidget {
  final List<Pokedex> pokedex;
  final int index;

  const PokemonScreen({super.key, required this.pokedex, required this.index});

  @override
  ConsumerState<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends ConsumerState<PokemonScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncPokemon = ref.watch(
      currentPokemonProvider((widget.pokedex, widget.index)),
    );
    final navigator = ref.read(
      pokemonNavigatorProvider((widget.pokedex, widget.index)).notifier,
    );

    return asyncPokemon.when(
      data: (pokemon) {
        if (pokemon == null) return const Center(child: Text("no Pokemon"));
        return Scaffold(
          backgroundColor: colorStringToType(pokemon.types.first),
          body: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.3,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            ColorUtils.white,
                            BlendMode.srcATop,
                          ),
                          child: Image.asset(
                            "assets/images/pokeball.png",
                            width: 200,
                            height: 200,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 75),

                  Expanded(
                    child: SafeArea(
                      top: false,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorUtils.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 40),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: pokemon.types.map((type) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: Chip(
                                        label: Text(
                                          type,
                                          style: FontUtils.headerSubtitle2(
                                            color: ColorUtils.white,
                                          ),
                                        ),
                                        backgroundColor: colorStringToType(
                                          type,
                                        ),
                                        visualDensity: const VisualDensity(
                                          horizontal: -4, // shrink width
                                          vertical: -4, // shrink height
                                        ),
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                    );
                                  }).toList(),
                                ),

                                SizedBox(height: 16),

                                Text(
                                  "About",
                                  style: FontUtils.headerSubtitle1(
                                    color: colorStringToType(
                                      pokemon.types.first,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 8),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 103,
                                      child: BodyInfo(
                                        value: pokemon.weight.toKg,
                                        icon: "assets/images/weight.png",
                                        title: "Weight",
                                      ),
                                    ),

                                    SizedBox(
                                      width: 1,
                                      height: 48,
                                      child: Container(
                                        color: ColorUtils.grayscaleLight,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 103,
                                      child: BodyInfo(
                                        value: pokemon.height.toMeters,
                                        icon: "assets/images/weight.png",
                                        title: "Height",
                                      ),
                                    ),

                                    SizedBox(
                                      width: 1,
                                      height: 48,
                                      child: Container(
                                        color: ColorUtils.grayscaleLight,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 103,
                                      child: AbilityInfo(
                                        value: pokemon.abilities,
                                        title: "Moves",
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      (pokemon.description ?? "").replaceAll(
                                        "\n",
                                        " ",
                                      ),
                                      style: FontUtils.body3(
                                        color: ColorUtils.dark,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 16),

                                Text(
                                  "Base Stats",
                                  style: FontUtils.headerSubtitle1(
                                    color: colorStringToType(
                                      pokemon.types.first,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 8),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: pokemon.stats.map((stat) {
                                    return StatInfo(
                                      title: stat.displayName,
                                      stat: stat.baseStat,
                                      color: colorStringToType(
                                        pokemon.types.first,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SafeArea(
                child: Stack(
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        PokemonHeader(
                          onBack: () {
                            navigator.dispose();
                            Navigator.of(context).pop();
                          },
                          title: pokemon.name,
                          number: pokemon.id,
                        ),
                        BannerPokemon(
                          onPrevious: () {
                            navigator.movePrevious();
                          },
                          onNext: () {
                            navigator.moveNext();
                          },
                          imageUrl: pokemon.imageUrl,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Error: $err")),
    );
  }
}
