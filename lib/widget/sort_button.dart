import 'package:flutter/cupertino.dart';

import '../utils/color_utils.dart';

class SortButton extends StatelessWidget {
  const SortButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(ColorUtils.primary, BlendMode.srcATop),
          child: Image.asset("assets/images/sort.png", width: 16, height: 16),
        ),
      ),
    );
  }
}
