import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../resources/resources.dart';

class ItemArtist extends StatelessWidget {
  String title;

  ItemArtist({this.title = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.size8, bottom: Sizes.size8),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size100),
            child: Image.network(
              "https://api.lorem.space/image/face?w=150&h=150",
              width: Sizes.size150,
              height: Sizes.size150,
            ),
          ),
          const SizedBox(height: Sizes.size12),
          SizedBox(
            width: Sizes.size150,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontSize: Sizes.size14,
              ),
              child: Text(lorem(paragraphs: 1, words: 5),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
            ),
          )
        ],
      ),
    );
  }
}
