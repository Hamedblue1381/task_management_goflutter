import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_goflutter/screens/all_tasks.dart';
import 'package:task_management_goflutter/screens/data_controller.dart';
import 'package:task_management_goflutter/widgets/button_view.dart';
import 'package:task_management_goflutter/widgets/textfield_view.dart';

import '/constants/app_colors.dart';
import '../utils/screen_size.dart';
import '../widgets/error_warning_ms.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    TextEditingController detailController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrOrWarning("Task name", "Your Task Name is empty");
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrOrWarning("Task detail", "task detail is empty");
        return false;
      } else if (detailController.text.length <= 10) {
        Message.taskErrOrWarning(
            "Task Detail", "Task detail should be atleast 10 characters");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 18, right: 18),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                IconButton(
                    onPressed: (() {
                      Get.back();
                    }),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textholder,
                    ))
              ],
            ),
            Column(
              children: [
                TextFieldWidget(
                    textController: nameController, hintText: "Task name"),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: "Task detail",
                  borderRadius: 15,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().postData(
                          nameController.text.trim(),
                          detailController.text.trim());

                      Get.to(
                        // ignore: prefer_const_constructors
                        () => AllTask(),
                        transition: Transition.circularReveal,
                      );
                    }
                  },
                  child: const ButtonWidget(
                      bgcolor: AppColors.mainColor,
                      text: "Add",
                      textColor: AppColors.textholder),
                )
              ],
            ),
            SizedBox(
              height: ScreenSize.screenHeight! / 20,
            )
          ],
        ),
      ),
    );
  }
}
