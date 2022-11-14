enum MainTab {
  home(0, "Home", "assets/icons/ic_library_outlined.png", "assets/icons/ic_library_filled.png"),
  explore(1, "Explore", "assets/icons/ic_explore_outlined.png",  "assets/icons/ic_explore_filled.png"),
  library(2, "Library", "assets/icons/ic_library_outlined.png",  "assets/icons/ic_library_filled.png");

  final int id;
  final String name;
  final String iconPath;
  final String selectedIconPath;

  const MainTab(this.id, this.name, this.iconPath, this.selectedIconPath);
}
