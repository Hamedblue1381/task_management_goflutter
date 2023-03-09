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
    print("passed id is$id");
    await Get.find<DataController>().getSingleTask(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    TextEditingController detailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    _loadSingleTask();
    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (controller) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(left: 18, right: 18),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/bg3.jpg"))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 45,
                ),
                IconButton(
                    onPressed: (() {
                      Get.back();
                    }),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.smallTextColor)),
                RichText(
                    text: const TextSpan(
                        text: "View Your task",
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.black,
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
                                  color: Colors.black,
                                  offset: Offset(5, 4),
                                )
                              ]))
                    ])),
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
                      textController: nameController,
                      hintText: '${controller.singleTask["task_name"]}',
                      readOnly: true,
                      colorBorder: Colors.blueGrey,
                      colorText: const Color.fromARGB(221, 82, 123, 235),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      textController: detailController,
                      hintText: '${controller.singleTask["task_detail"]}',
                      readOnly: true,
                      colorBorder: Colors.blueGrey,
                      colorText: const Color.fromARGB(221, 82, 123, 235),
                      borderRadius: 20,
                      maxLines: 5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.screenHeight! / 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
