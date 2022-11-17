import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/model/models.dart';
import '../../resources/resources.dart';

class ItemBanners extends StatelessWidget {
  final Banners banners;

  const ItemBanners(this.banners, {super.key});

  @override
  Widget build(BuildContext context) {
    return _item(banners);
  }

  Widget _item(Banners banners) {
    final items = banners.items;
    if (items == null || items.isEmpty) {
      return const SizedBox();
    }
    return CarouselSlider(
      options: CarouselOptions(),
      items: items.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: Sizes.size8),
              child: banner.cover != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(Sizes.size8),
                      child: Image.network(
                        banner.banner ?? "",
                        fit: BoxFit.cover,
                      ),
                    )
                  : null,
            );
          },
        );
      }).toList(),
    );
  }
}
