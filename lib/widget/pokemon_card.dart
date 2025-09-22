import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/extension/string_extension.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:pokeapi_flutter/utils/font_utils.dart';

class PokemonCard extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final VoidCallback? onTap;

  const PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 🔹 optional: tap to navigate to detail
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorUtils.background),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 12,
              right: 8,
              child: Text(
                "#$id",
                style: FontUtils.caption(color: ColorUtils.grayscaleMedium),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 44,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorUtils.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Spacer(),
                      Text(
                        name.capitalize(),
                        textAlign: TextAlign.center,
                        style: FontUtils.body3(color: ColorUtils.dark),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),

            Image.network(imageUrl, height: 72, width: 72, fit: BoxFit.contain),
          ],
        ),
      ),
    );
  }
}
