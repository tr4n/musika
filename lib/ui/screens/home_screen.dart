import 'package:flutter/material.dart';
import 'package:musium/blocs/home_bloc.dart';
import 'package:musium/data/model/models.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/components/components.dart';
import 'package:musium/ui/components/item_artist_spotlights.dart';
import 'package:musium/ui/components/item_banners.dart';
import 'package:musium/ui/components/item_mixes.dart';
import 'package:musium/ui/components/item_new_releases.dart';
import 'package:musium/ui/components/item_playlists.dart';
import 'package:musium/ui/screens/playlist_screen.dart';

import '../../resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();

  _onPlaylistTap(Playlist playlist) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlaylistScreen(playlist)),
    );
  }

  @override
  Widget build(BuildContext context) {
    _homeBloc.getHomeData();
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
          _banners(),
          const SizedBox(height: Sizes.size32),
          _newReleases(),
          const SizedBox(height: Sizes.size32),
          _popularArtists(),
          const SizedBox(height: Sizes.size8),
          _playlists(),
          const SizedBox(height: Sizes.size8),
          _yourTopMixes(),
          // const SizedBox(height: Sizes.size32),
          // _basedOnYourRecentListening(),
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

  Widget _banners() {
    return StreamBuilder(
      stream: _homeBloc.bannersObservable,
      builder: (context, snapshot) {
        final banners = snapshot.data;
        if (banners == null || banners.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          children: banners.map((e) => ItemBanners(e)).toList(),
        );
      },
    );
  }

  Widget _newReleases() {
    return StreamBuilder(
      stream: _homeBloc.newReleasesObservable,
      builder: (context, snapshot) {
        final newReleases = snapshot.data;
        if (newReleases == null) {
          return const SizedBox();
        }
        return Column(
          children: newReleases.map((e) => ItemNewReleases(e)).toList(),
        );
      },
    );
  }

  Widget _playlists() {
    return StreamBuilder(
      stream: _homeBloc.playlistsObservable,
      builder: (context, snapshot) {
        final playlistsList = snapshot.data;
        if (playlistsList == null || playlistsList.isEmpty) {
          return const SizedBox();
        }
        return Column(
          children: playlistsList
              .map((playlists) => ItemPlaylists(
                    playlists: playlists,
                    onPlaylistTap: _onPlaylistTap,
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _popularArtists() {
    return StreamBuilder(
      stream: _homeBloc.artistsObservable,
      builder: (context, snapshot) {
        final artists = snapshot.data;
        if (artists == null) {
          return const SizedBox();
        }
        return Column(
          children: artists.map((e) => ItemArtistSpotlights(e)).toList(),
        );
      },
    );
  }

  Widget _yourTopMixes() {
    return StreamBuilder(
      stream: _homeBloc.mixesObservable,
      builder: (context, snapshot) {
        final mixesList = snapshot.data;
        if (mixesList == null || mixesList.isEmpty) {
          return const SizedBox();
        }
        return Column(
          children: mixesList.map((e) => ItemMixes(e)).toList(),
        );
      },
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
