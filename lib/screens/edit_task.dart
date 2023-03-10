import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_goflutter/screens/all_tasks.dart';
import 'package:task_management_goflutter/screens/data_controller.dart';
import 'package:task_management_goflutter/widgets/button_view.dart';
import 'package:task_management_goflutter/widgets/textfield_view.dart';

import '/constants/app_colors.dart';
import '../utils/screen_size.dart';
import '../widgets/error_warning_ms.dart';

class EditTask extends StatelessWidget {
  final int id;
  const EditTask({super.key, required this.id});
  _loadSingleTask() async {
    // print("passed id is$id");
    await Get.find<DataController>().getSingleTask(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    TextEditingController detailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    Get.lazyPut((() => DataController()));
    _loadSingleTask();
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
                fit: BoxFit.cover, image: AssetImage("assets/images/bg3.jpg"))),
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
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: (() {
                      Get.back();
                    }),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.secondaryColor)),
              ],
            ),
            GetBuilder<DataController>(builder: ((controller) {
              nameController.text =
                  controller.singleTask["task_name"] ?? "task name not found";
              detailController.text = controller.singleTask["task_detail"] ??
                  "task detail not found";
              return Column(
                children: [
                  TextFieldWidget(
                    textController: nameController,
                    hintText: "Task name",
                    colorBorder: const Color.fromARGB(221, 10, 88, 177),
                    colorText: const Color.fromARGB(181, 241, 239, 239),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    textController: detailController,
                    hintText: "Task detail",
                    colorBorder: const Color.fromARGB(221, 10, 88, 177),
                    colorText: const Color.fromARGB(181, 241, 239, 239),
                    borderRadius: 15,
                    maxLines: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_dataValidation()) {
                        Get.find<DataController>().updateData(
                            nameController.text.trim(),
                            detailController.text.trim(),
                            int.parse(controller.singleTask["id"]));

                        Get.to(
                          // ignore: prefer_const_constructors
                          () => AllTask(),
                          transition: Transition.circularReveal,
                        );
                      }
                    },
                    child: const ButtonWidget(
                        bgcolor: AppColors.secondaryColor,
                        text: "Edit",
                        textColor: AppColors.textholder),
                  )
                ],
              );
            })),
            SizedBox(
              height: ScreenSize.screenHeight! / 20,
            )
          ],
        ),
      ),
    );
  }
}
