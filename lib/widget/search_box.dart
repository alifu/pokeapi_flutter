import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapi_flutter/utils/color_utils.dart';

class SearchBox extends ConsumerStatefulWidget {
  const SearchBox({super.key});

  @override
  ConsumerState<SearchBox> createState() => _SearchBox();
}

class _SearchBox extends ConsumerState<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                ColorUtils.primary,
                BlendMode.srcATop,
              ),
              child: Image.asset(
                "assets/images/search.png",
                width: 16,
                height: 16,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                isDense: true,
                hintText: "search",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 4,
                ),
              ),
              onChanged: (text) {
                print('Text changed: $text');
              },
              onSubmitted: (text) {
                print('Text submitted: $text');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: GestureDetector(
              onTap: () {
                _controller.clear();
              },
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ColorUtils.primary,
                  BlendMode.srcATop,
                ),
                child: Image.asset(
                  "assets/images/close.png",
                  width: 16,
                  height: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
