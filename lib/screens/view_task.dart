import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_goflutter/screens/data_controller.dart';

import '../constants/app_colors.dart';
import '../utils/screen_size.dart';
import '../widgets/textfield_view.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({super.key, required this.id});

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
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(left: 18, right: 18),
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/images/bg4.jpg"))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 30,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: (() {
                Get.back();
              }),
              icon: const Icon(Icons.arrow_back, color: AppColors.textholder)),
          RichText(
              text: const TextSpan(
                  text: "View Your task",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Color.fromARGB(255, 0, 204, 255),
                          offset: Offset(5, 4),
                        )
                      ]),
                  children: [
                TextSpan(
                    text: "\n You're amazing",
                    style: TextStyle(
                        color: AppColors.textholder,
                        fontSize: 16,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Color.fromARGB(255, 0, 204, 255),
                            offset: Offset(5, 4),
                          )
                        ]))
              ])),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<DataController>(builder: (controller) {
            nameController.text =
                controller.singleTask["task_name"] ?? "task name not found";
            detailController.text =
                controller.singleTask["task_detail"] ?? "task detail not found";
            return Column(
              children: [
                TextFieldWidget(
                  textController: nameController,
                  hintText: 'Task Name',
                  readOnly: true,
                  colorBorder: const Color.fromARGB(255, 153, 153, 153),
                  colorText: const Color.fromARGB(235, 255, 255, 255),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: 'Task Detail',
                  readOnly: true,
                  colorBorder: const Color.fromARGB(255, 153, 153, 153),
                  colorText: const Color.fromARGB(235, 255, 255, 255),
                  borderRadius: 20,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
          SizedBox(
            height: ScreenSize.screenHeight! / 20,
          )
        ],
      ),
    ));
  }
}
