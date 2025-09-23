import 'package:flutter/cupertino.dart';
import 'package:pokeapi_flutter/extension/string_extension.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';

class BodyInfo extends StatelessWidget {
  final String value;
  final String icon;
  final String title;

  BodyInfo({required this.value, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorFiltered(
              colorFilter: ColorFilter.mode(ColorUtils.dark, BlendMode.srcATop),
              child: Image.asset(icon, width: 16, height: 16),
            ),

            Text(value, style: FontUtils.body3(color: ColorUtils.dark)),
          ],
        ),

        SizedBox(height: 4),

        Text(
          title.capitalize(),
          style: FontUtils.caption(color: ColorUtils.grayscaleMedium),
        ),
      ],
    );
  }
}
