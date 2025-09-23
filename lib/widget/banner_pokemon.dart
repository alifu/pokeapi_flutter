import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BannerPokemon extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final String imageUrl;

  const BannerPokemon({
    super.key,
    required this.onPrevious,
    required this.onNext,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onPrevious,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              ColorUtils.white,
              BlendMode.srcATop,
            ),
            child: Image.asset(
              "assets/images/chevron_left.png",
              width: 32,
              height: 32,
            ),
          ),
        ),

        SizedBox(width: 24),

        SizedBox(
          width: 200,
          height: 200,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage("assets/images/silhouette.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 24),

        GestureDetector(
          onTap: onNext,
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              ColorUtils.white,
              BlendMode.srcATop,
            ),
            child: Image.asset(
              "assets/images/chevron_right.png",
              width: 32,
              height: 32,
            ),
          ),
        ),
      ],
    );
  }
}