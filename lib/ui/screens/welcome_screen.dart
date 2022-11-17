import 'package:flutter/material.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/components/button.dart';
import 'package:musium/ui/screens/screens.dart';

import '../../resources/resources.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _onTapStart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: context.safeTopPadding),
        color: AppColor.whiteD9D9D9,
        child: _welcomeBody());
  }

  Widget _welcomeBody() {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              const SizedBox(width: double.infinity, height: double.infinity),
              Positioned(top: 146, left: 50, child: _circle(50)),
              Positioned(top: 46, right: 72, child: _circle(40)),
              Positioned(top: 46, left: 64, child: _circle(40)),
              Positioned(top: 23, left: 100, child: _circle(10)),
              Positioned(top: 32, left: 250, child: _circle(23)),
              Positioned(top: 250, left: 43, child: _circle(30)),
              Positioned(top: 210, right: 25, child: _circle(25)),
              Positioned(top: 180, right: 24, child: _circle(5)),
              Positioned(
                bottom: 85,
                child: Container(
                  width: context.screenWidth,
                  alignment: Alignment.center,
                  child: _circle(225),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: context.screenWidth,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/img_girl_2.png",
                    width: context.screenWidth * 0.8,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        _bottomIntroduction()
      ],
    );
  }

  Widget _bottomIntroduction() {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(54),
          topRight: Radius.circular(54),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 60),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Listen to the best music every day with ",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: Sizes.size28,
              ),
              children: [
                TextSpan(
                    text: "Musika",
                    style: TextStyle(color: AppColor.green06C149)),
                const TextSpan(text: " now!"),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _circle(8),
              const SizedBox(width: 8),
              _circle(8),
              const SizedBox(width: 8),
              _circle(8),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            color: AppColor.green06C149,
            text: "Get Started",
            width: context.screenWidth * 0.8,
            onTap: _onTapStart,
          ),
          SizedBox(height: context.safeBottomPadding + 24),
        ],
      ),
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration:
          BoxDecoration(color: AppColor.green06C149, shape: BoxShape.circle),
    );
  }
}
