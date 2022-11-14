import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class AppButton extends StatelessWidget {
  Color color = AppColor.green06C149;
  String text = "";
  double? width;
  double? height;

  void Function()? onTap;

  AppButton(
      {this.color = Colors.white,
      this.text = "",
      this.width,
      this.height,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: Sizes.size16,
          top: Sizes.size16,
          right: Sizes.size16,
          bottom: Sizes.size16,
        ),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.size100)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 75,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
          ),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
