import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;
  final bool readOnly;
  final Color colorText;
  final Color colorBorder;
  final Color colorFont;
  const TextFieldWidget(
      {super.key,
      required this.textController,
      required this.hintText,
      this.borderRadius = 30,
      this.maxLines = 1,
      this.readOnly = false,
      this.colorBorder = Colors.white,
      this.colorText = Colors.white,
      this.colorFont = Colors.black});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
          filled: true,
          fillColor: colorText,
          hintText: hintText,
          hintStyle: TextStyle(color: colorFont),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(color: colorBorder, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(color: colorBorder, width: 1))),
    );
  }
}
