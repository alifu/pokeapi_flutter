import 'package:flutter/cupertino.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';

class PokedexHeader extends StatelessWidget {
  const PokedexHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}