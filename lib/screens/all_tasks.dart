import 'package:flutter/material.dart';
import 'package:task_management_goflutter/utils/app_colors.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height / 3.2,
          padding: const EdgeInsets.only(left: 10, top: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bg3.jpg"))),
          child: IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              )),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              const Icon(
                Icons.home,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: AppColors.smallTextColor),
                child: const Icon(
                  Icons.add,
                  color: AppColors.textholder,
                  size: 20,
                ),
              ),
              Expanded(child: Container()),
              const Icon(
                Icons.calendar_month_sharp,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "2",
                style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),
              )
            ],
          ),
        )
      ]),
    );
  }
}
