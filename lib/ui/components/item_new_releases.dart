import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../data/model/models.dart';
import '../../resources/resources.dart';

class ItemNewReleases extends StatelessWidget {
  final NewReleases newReleases;

  const ItemNewReleases(this.newReleases, {super.key});

  @override
  Widget build(BuildContext context) {
    final items = newReleases.items?.all;
    if (items == null || items.isEmpty) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                child: Text(
                  newReleases.title ?? "New Releases",
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: Sizes.size8),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.green06C149,
                  ),
                  child: const Text("See All", textAlign: TextAlign.start),
                ),
              ),
            ],
          ),
          const SizedBox(height: Sizes.size24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: items.map((e) => _item(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(NewRelease newRelease) {
    return Container(
      margin: const EdgeInsets.only(right: Sizes.size8, bottom: Sizes.size8),
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size28),
            child: Image.network(
              newRelease.thumbnailM ??
                  "https://api.lorem.space/image/album?w=150&h=150",
              width: Sizes.size150,
              height: Sizes.size150,
              fit: BoxFit.cover,
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
              child: Text(
                  newRelease.artistsNames ?? lorem(paragraphs: 1, words: 5),
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
