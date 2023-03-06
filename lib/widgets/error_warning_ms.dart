import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class Message {
  static void taskErrOrWarning(String taskName, String taskErrOrWarning) {
    Get.snackbar(taskName, taskErrOrWarning,
        backgroundColor: AppColors.mainColor,
        titleText: Text(
          taskName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.deleteRed,
          ),
        ),
        messageText: Text(
          taskErrOrWarning,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber),
        ));
  }
}
