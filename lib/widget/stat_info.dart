import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';

class StatInfo extends StatelessWidget {
  final String title;
  final int stat;
  final Color color;

  StatInfo({required this.title, required this.stat, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 32,
          child: Text(
            title.toUpperCase(),
            style: FontUtils.headerSubtitle3(color: color),
            textAlign: TextAlign.end,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: SizedBox(
            width: 1,
            height: 16,
            child: Container(color: ColorUtils.grayscaleLight),
          ),
        ),

        SizedBox(
          width: 32,
          child: Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text(
              "$stat",
              style: FontUtils.body3(color: ColorUtils.dark),
              textAlign: TextAlign.end,
            ),
          ),
        ),

        Expanded(
          child: LinearProgressIndicator(
            value: stat/100,
            backgroundColor: color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
