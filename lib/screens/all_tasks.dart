import 'package:flutter/material.dart';
import 'package:task_management_goflutter/utils/app_colors.dart';

import '../widgets/task_widget.dart';

class AllTask extends StatelessWidget {
  const AllTask({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = [
      "Try Harder",
      "Try Smarter",
    ];
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xFF2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        color: Colors.white,
        Icons.edit,
      ),
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromARGB(255, 255, 0, 0),
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
        ),
        Flexible(
          child: ListView.builder(
              itemCount: myData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  onDismissed: (DismissDirection direction) {},
                  confirmDismiss: (DismissDirection direction) async {
                    return false;
                  },
                  key: ObjectKey(index),
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: TaskWidget(
                        text: myData[index],
                        color: Colors.blueGrey,
                      )),
                );
              }),
        ),
      ]),
    );
  }
}
