import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color color;
  const TaskWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color: const Color(0xFFedf0f8),
          borderRadius: BorderRadius.circular(10)),
      child: Text(text,
          style: TextStyle(
            fontSize: 20,
            color: color,
          )),
    );
  }
}
