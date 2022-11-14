import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:musium/common/type/main_tab.dart';
import 'package:musium/resources/resources.dart';
import 'package:musium/ui/screens/screens.dart';
import 'package:musium/ui/screens/welcome_screen.dart';

import '../../resources/colors.dart';
import '../components/components.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "urbanist",
        primaryColor: Colors.white,
        brightness: Brightness.light,
        primaryColorDark: Colors.black,
        canvasColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  final _screens = [
    ScreenTab(MainTab.home, const HomeScreen()),
    ScreenTab(MainTab.explore, const ExploreScreen()),
    ScreenTab(MainTab.library, const LibraryScreen())
  ];

  Color _getSelectedColor(int index) {
    return _selectedTab == index ? AppColor.green06C149 : AppColor.gray979797;
  }

  Color _getIcon(int index) {
    if (index == 0) {}
    return _selectedTab == index ? AppColor.green06C149 : AppColor.gray979797;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _screens[_selectedTab].page,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Sizes.size32),
              topRight: Radius.circular(Sizes.size32),
            ),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 4),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Sizes.size32),
              topRight: Radius.circular(Sizes.size32),
            ),
            child: BottomNavigationBar(
              items: _screens
                  .map(
                    (screen) => BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.all(Sizes.size8),
                        child: Image.asset(
                          _selectedTab == screen.tab.id
                              ? screen.tab.selectedIconPath
                              : screen.tab.iconPath,
                          width: 16,
                          height: 16,
                          color: _getSelectedColor(screen.tab.id),
                        ),
                      ),
                      label: screen.tab.name,
                    ),
                  )
                  .toList(),
              onTap: (index) => setState(() => _selectedTab = index),
              currentIndex: _selectedTab,
              selectedItemColor: AppColor.green06C149,
              unselectedItemColor: AppColor.gray979797,
              unselectedFontSize: 11,
              selectedFontSize: 12,
              //backgroundColor: Colors.black,
            ),
          ),
        ));
  }
}
