import 'package:flutter/material.dart';
import 'package:task_management_goflutter/utils/app_colors.dart';
import 'package:task_management_goflutter/widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController detailController = TextEditingController();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/background.jpg"))),
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
                    onPressed: (() {}),
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
                  height: 20,
                ),
                TextFieldWidget(
                  textController: detailController,
                  hintText: "Task detail",
                  borderRadius: 15,
                  maxLines: 3,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
            )
          ],
        ),
      ),
    );
  }
}
