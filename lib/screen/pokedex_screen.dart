import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';

class PokedexScreen extends ConsumerStatefulWidget {
  const PokedexScreen({super.key});

  @override
  ConsumerState<PokedexScreen> createState() => _PokedexScreen();
}

class _PokedexScreen extends ConsumerState<PokedexScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ColorUtils.white,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/pokeball.png",
                  width: 32,
                  height: 32,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Pokédex",
                style: FontUtils.headerHeadline(color: ColorUtils.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
