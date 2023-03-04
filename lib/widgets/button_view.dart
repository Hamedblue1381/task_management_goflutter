import 'package:flutter/material.dart';

import '../utils/screen_size.dart';

class ButtonWidget extends StatelessWidget {
  final Color bgcolor;
  final String text;
  final Color textColor;
  const ButtonWidget(
      {super.key,
      required this.bgcolor,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Container(
      width: double.maxFinite,
      height: ScreenSize.screenHeight! / 14,
      decoration: BoxDecoration(
          color: bgcolor, borderRadius: BorderRadius.circular(40)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
      ),
    );
  }
}
