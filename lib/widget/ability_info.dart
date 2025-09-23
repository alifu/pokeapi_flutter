import 'package:flutter/cupertino.dart';
import 'package:pokeapi_flutter/extension/string_extension.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';

class AbilityInfo extends StatelessWidget {
  final List<String> value;
  final String title;

  AbilityInfo({required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: value.map((ability) {
            return Text(ability, style: FontUtils.body3(color: ColorUtils.dark));
          }).toList(),
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
