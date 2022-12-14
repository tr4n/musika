import 'package:flutter/material.dart';
import 'package:musium/extension/context_ext.dart';
import 'package:musium/ui/screens/screens.dart';

import '../../resources/resources.dart';
import '../components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  _onTapStart() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: context.safeTopPadding),
        color: AppColor.gray1E1E1E,
        child: _welcomeBody());
  }

  Widget _welcomeBody() {
    return Column(
      children: [
        SizedBox(height: context.safeTopPadding),
        _logoImage(),
        const SizedBox(height: Sizes.size48),
        const DefaultTextStyle(
          style: TextStyle(
              color: Colors.white, fontSize: 44, fontWeight: FontWeight.w700),
          child: Text(
            "Let's get you in Spotify",
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: Sizes.size48),
        AppButton(
          color: AppColor.blue41C3D6,
          text: "Login with Spotify",
          width: context.screenWidth * 0.8,
          onTap: _onTapStart,
        ),
        SizedBox(height: context.safeBottomPadding + 24),
      ],
    );
  }

  Widget _logoImage() {
    return BlendMask(
      opacity: 1.0,
      blendMode: BlendMode.screen,
      child: Image.asset("assets/images/logo_app_512.png",
          width: context.screenWidth * 0.6, fit: BoxFit.cover),
    );
  }
}
