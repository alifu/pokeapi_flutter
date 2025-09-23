import 'package:flutter/cupertino.dart';
import 'package:pokeapi_flutter/extension/string_extension.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';

class PokemonHeader extends StatelessWidget {
  final VoidCallback onBack;
  final String title;
  final int number;

  const PokemonHeader({
    super.key,
    required this.onBack,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 76,
      child: Padding(
        padding: EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: onBack,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ColorUtils.white,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/arrow_back.png",
                  width: 32,
                  height: 32,
                ),
              ),
            ),

            SizedBox(width: 8),

            Text(
              title.capitalize(),
              textAlign: TextAlign.left,
              style: FontUtils.headerHeadline(color: ColorUtils.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            Spacer(),

            Text(
              "#$number",
              style: FontUtils.headerSubtitle2(color: ColorUtils.white),
            ),
          ],
        ),
      ),
    );
  }
}