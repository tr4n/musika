import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musium/common/type/main_tab.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/components/components.dart';
import 'package:musium/ui/components/item_artist.dart';
import 'package:musium/ui/components/item_recent_listening.dart';
import 'package:musium/ui/components/item_top_mix.dart';
import 'package:musium/ui/components/item_trending.dart';
import 'package:musium/ui/screens/screens.dart';

import '../../resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  final _screens = [
    ScreenTab(MainTab.home, const HomeScreen()),
    ScreenTab(MainTab.explore, const ExploreScreen()),
    ScreenTab(MainTab.library, const LibraryScreen())
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: _homeBody());
  }

  Widget _homeBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.safeTopPadding + Sizes.size16),
          _actionBar(),
          const SizedBox(height: Sizes.size32),
          _trendingNow(),
          const SizedBox(height: Sizes.size32),
          _popularArtists(),
          const SizedBox(height: Sizes.size32),
          _yourTopMixes(),
          const SizedBox(height: Sizes.size32),
          _basedOnYourRecentListening(),
        ],
      ),
    );
  }

  Widget _actionBar() {
    return Row(
      children: [
        const SizedBox(width: Sizes.size24),
        Container(
          height: Sizes.size48,
          width: Sizes.size48,
          padding: const EdgeInsets.all(2),
          child: ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child:
                  Image.network("https://i.pravatar.cc/100", fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(width: Sizes.size16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.size14,
                  ),
                  child: Text("Good Morning !")),
              SizedBox(height: Sizes.size8),
              DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w700,
                  ),
                  child: Text("Andrew Ainsley"))
            ],
          ),
        ),
        IconButton(
          onPressed: null,
          icon:
              Image.asset("assets/icons/ic_search.png", width: 28, height: 28),
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.notifications_none,
            size: 28,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: Sizes.size24),
      ],
    );
  }

  Widget _trendingNow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DefaultTextStyle(
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                child: Text("Trending Now", textAlign: TextAlign.start),
              ),
              Container(
                margin: const EdgeInsets.only(right: Sizes.size16),
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
              children: [0, 1, 2, 3, 4, 5]
                  .map((e) => ItemTrending(title: e.toString()))
                  .toList(),
            ),
          ),
          // GridView.count(
          //   shrinkWrap: true,
          //   crossAxisCount: 2,
          //   mainAxisSpacing: Sizes.size8,
          //   crossAxisSpacing: Sizes.size12,
          //   scrollDirection: Axis.vertical,
          //   childAspectRatio: 180 / 50,
          //   children: [0, 1, 2, 3, 4, 5].map((e) => ItemTrending()).toList(),
          // ),
        ],
      ),
    );
  }

  Widget _popularArtists() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const DefaultTextStyle(
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                child: Text("Popular Artists", textAlign: TextAlign.start),
              ),
              Container(
                margin: const EdgeInsets.only(right: Sizes.size16),
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
              children: [0, 1, 2, 3, 4, 5]
                  .map((e) => ItemArtist(title: e.toString()))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _yourTopMixes() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text("Your Top Mixes", textAlign: TextAlign.start),
          ),
          const SizedBox(height: Sizes.size8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [1, 2, 3, 4, 5, 6].map((e) => ItemTopMix()).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _basedOnYourRecentListening() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultTextStyle(
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: Text("Based on your recent listening",
                textAlign: TextAlign.start),
          ),
          const SizedBox(height: Sizes.size12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  [0, 1, 2, 3, 4, 5].map((e) => ItemRecentListening()).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
