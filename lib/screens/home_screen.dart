import 'package:flutter/material.dart';
import 'package:task_management_goflutter/utils/app_colors.dart';
import 'package:task_management_goflutter/widgets/button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background2.jpg"))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: const TextSpan(
                    text: "Hello",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                      text: "\nI'm Hamed",
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 16,
                      ))
                ])),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            const ButtonWidget(
                bgcolor: AppColors.mainColor,
                text: "Add Task",
                textColor: Colors.white),
            SizedBox(
              height: MediaQuery.of(context).size.height / 70,
            ),
            const ButtonWidget(
                bgcolor: AppColors.textholder,
                text: "View",
                textColor: AppColors.smallTextColor)
          ],
        ),
      ),
    );
  }
}
