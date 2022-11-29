import 'package:flutter/material.dart';

import '../../common/type/explore_sections.dart';
import '../../resources/resources.dart';
import '../components/components.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final _textController = TextEditingController();

  _onSearchChanged(String text) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          padding: const EdgeInsets.only(left: Sizes.size16),
          child: Image.asset(
            "assets/icons/ic_music_64.png",
            width: Sizes.size24,
            height: Sizes.size24,
          ),
        ),
        leadingWidth: Sizes.size40,
        title: const DefaultTextStyle(
          style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w700),
          child: Text("Explore"),
        ),
        actions: [
          IconButton(
            onPressed: null,
            padding: const EdgeInsets.only(right: Sizes.size16),
            icon: Image.asset(
              "assets/icons/ic_more_circle.png",
              width: Sizes.size28,
              height: Sizes.size28,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: _exploreBody(),
    );
  }

  Widget _exploreBody() {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              _searchBar(),
              const SizedBox(height: Sizes.size16),
              Expanded(child: _suggestion())
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: Sizes.size44,
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size22),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.size12))),
      child: TextField(
        controller: _textController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Songs, Artists, Podcasts & More",
          prefixIcon: Icon(Icons.search_rounded,
              color: Colors.black12, size: Sizes.size20),
          hintStyle: TextStyle(color: Colors.black12, fontSize: Sizes.size13),
        ),
        textInputAction: TextInputAction.search,
        style: const TextStyle(fontSize: Sizes.size13, color: Colors.black),
        textAlignVertical: TextAlignVertical.center,
        onChanged: _onSearchChanged,
        onEditingComplete: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }

  Widget _suggestion() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size16),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: Sizes.size12,
        crossAxisSpacing: Sizes.size12,
        scrollDirection: Axis.vertical,
        childAspectRatio: 30 / 18,
        children: ExploreSection.values.map((e) => ItemExplore(e)).toList(),
      ),
    );
  }
}
