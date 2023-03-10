import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_goflutter/routes/routes.dart';
import 'package:task_management_goflutter/widgets/button_view.dart';

import '../../constants/app_colors.dart';
import '../utils/screen_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
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
                    text: "  Task Management",
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Color.fromARGB(234, 224, 224, 224),
                            offset: Offset(5, 4),
                          )
                        ]),
                    children: [
                  TextSpan(
                      text: "\nBy Hamed",
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 16,
                      ))
                ])),
            SizedBox(
              height: ScreenSize.screenHeight! / 3,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RoutesClass.addTask);
              },
              child: const ButtonWidget(
                  bgcolor: AppColors.mainColor,
                  text: "Add Task",
                  textColor: Colors.white),
            ),
            SizedBox(
              height: ScreenSize.screenHeight! / 70,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RoutesClass.allTask);
              },
              child: const ButtonWidget(
                  bgcolor: AppColors.textholder,
                  text: "View Tasks",
                  textColor: AppColors.smallTextColor),
            )
          ],
        ),
      ),
    );
  }
}
