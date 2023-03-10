import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_goflutter/routes/routes.dart';
import 'package:task_management_goflutter/screens/data_controller.dart';
import 'package:task_management_goflutter/utils/screen_size.dart';
import 'package:task_management_goflutter/widgets/button_view.dart';

import '../../constants/app_colors.dart';
import '../widgets/task_widget.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut((() => DataController()));
    _loadData();

    ScreenSize.init(context);

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColors.editGrey,
      alignment: Alignment.centerLeft,
      child: const Icon(
        color: Colors.white,
        Icons.edit,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: AppColors.deleteRed,
      alignment: Alignment.centerRight,
      child: const Icon(
        color: Colors.white,
        Icons.delete,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          width: double.maxFinite,
          height: ScreenSize.screenHeight! / 3.2,
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bg5.jpg"))),
          child: IconButton(
              onPressed: (() {
                Get.back();
              }),
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: (() {
                  Get.toNamed(RoutesClass.getHomeRoute());
                }),
                icon: const Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: AppColors.smallTextColor),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesClass.getAddTaskRoute());
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.textholder,
                    size: 20,
                  ),
                ),
              ),
              Expanded(child: Container()),
              const Icon(
                Icons.task,
                color: AppColors.secondaryColor,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "2",
                style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(child: GetBuilder<DataController>(
          builder: (controller) {
            return ListView.builder(
                itemCount: controller.myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightDeleteIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor:
                                const Color.fromARGB(36, 130, 230, 255),
                            barrierColor:
                                const Color.fromARGB(143, 235, 235, 235),
                            context: context,
                            builder: (_) {
                              return Container(
                                height: 650,
                                decoration: BoxDecoration(
                                    color: AppColors.trnsprntGrey,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // Get.off(() => ViewTask(
                                            //     id: int.parse(controller
                                            //         .myData[index]["id"]
                                            //         .toString())));
                                            Get.toNamed(
                                                RoutesClass.getViewTaskRoute(
                                                    controller.myData[index]
                                                            ["id"]
                                                        .toString()));
                                          },
                                          child: const ButtonWidget(
                                              bgcolor: AppColors.mainColor,
                                              text: "View",
                                              textColor: AppColors.textholder),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // Get.off(() => EditTask(
                                            //     id: int.parse(controller
                                            //         .myData[index]["id"]
                                            //         .toString())));
                                            Get.toNamed(
                                                RoutesClass.getEditTaskRoute(
                                                    controller.myData[index]
                                                            ["id"]
                                                        .toString()));
                                          },
                                          child: const ButtonWidget(
                                              bgcolor: AppColors.mainColor,
                                              text: "Edit",
                                              textColor: AppColors.textholder),
                                        )
                                      ]),
                                ),
                              );
                            });
                        return false;
                      } else {
                        controller.deleteData(
                            int.parse(controller.myData[index]["id"]));
                        return Future.delayed(const Duration(milliseconds: 500),
                            () => direction == DismissDirection.endToStart);
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: TaskWidget(
                          text: controller.myData[index]["task_name"],
                          color: AppColors.textGrey,
                        )),
                  );
                });
          },
        )),
      ]),
    );
  }
}
