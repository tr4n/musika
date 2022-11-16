import 'package:flutter/material.dart';
import 'package:musium/di/locator.dart';
import 'package:musium/ui/screens/main_screen.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}
