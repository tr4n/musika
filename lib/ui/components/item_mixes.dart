import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:musium/data/model/mix/mixes.dart';

import '../../data/model/models.dart';
import '../../resources/resources.dart';

class ItemMixes extends StatelessWidget {
  final List<Color> _colors = [
    const Color(0xFFFF7777),
    const Color(0xFFFFFA77),
    const Color(0xFF77FF95),
    const Color(0xFF777EFF),
    const Color(0xFF783B8C),
    const Color(0xFF8C3B3B),
    const Color(0xFF539807),
    const Color(0xFF8831EA),
    const Color(0xFF134CB5),
    const Color(0xFF001026),
    const Color(0xFFFF0000),
    const Color(0xFF5495F8),
  ];

  final Mixes mixes;

  ItemMixes(this.mixes, {super.key});

  @override
  Widget build(BuildContext context) {
    final mixesItems = mixes.items;
    final title = mixes.title;
    if (mixesItems == null ||
        mixesItems.isEmpty ||
        title == null ||
        title.isEmpty) {
      return const SizedBox();
    }
    return Container(
      margin: const EdgeInsets.only(top: Sizes.size16),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            child: Text(
              mixes.title ?? lorem(paragraphs: 1, words: 5),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: Sizes.size8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: mixesItems
                  .mapIndexed((index, mix) => _item(index, mix))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(int index, Mix mix) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.size16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size8),
            child: Image.network(
              mix.thumbnail ??
                  "https://api.lorem.space/image/album?w=150&h=150",
              width: Sizes.size150,
              height: Sizes.size150,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(top: 20, left: -13, child: _circle(Sizes.size26)),
          Positioned(right: -34, top: 50, child: _circle(68)),
          Positioned(
            bottom: 0,
            child: Container(
              height: 5,
              width: 150,
              decoration: BoxDecoration(
                color: _colors[index % _colors.length],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Sizes.size8),
                  bottomRight: Radius.circular(Sizes.size8),
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 24,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: Sizes.size14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: Text(mix.title ?? lorem(paragraphs: 1, words: 5),
                  textAlign: TextAlign.start),
            ),
          )
        ],
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration:
          const BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
    );
  }
}
