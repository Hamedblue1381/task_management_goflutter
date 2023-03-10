import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:task_management_goflutter/constants/http_consts.dart';
import 'package:task_management_goflutter/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  // ignore: prefer_final_fields
  Map<String, dynamic> _singleTask = {};
  Map<String, dynamic> get singleTask => _singleTask;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(HttpConstants.GET_TASKS);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data ");
      update();
    } else {
      print(response.statusCode.toString());
    }
  }

  Future<void> getSingleTask(String taskID) async {
    _isLoading = true;
    Response response =
        await service.getData('${HttpConstants.GET_TASK}' '?id=$taskID');
    if (response.statusCode == 200) {
      if (kDebugMode) {
        var task = response.body;
        // print("we got Single Task$task");
      }
      _singleTask = json.decode(response.body);
    } else {
      print(response.statusCode.toString());
    }
    _isLoading = false;
    update();
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData(HttpConstants.POST_TASK, {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      print("data successfuly sent!");
    } else {
      print(response.statusCode.toString());
    }
    // _isLoading = false;
    update();
  }

  Future<void> updateData(String task, String taskDetail, int taskID) async {
    _isLoading = true;
    Response response =
        await service.updateData('${HttpConstants.UPDATE_TASK}' '?id=$taskID', {
      "task_name": task,
      "task_detail": taskDetail,
    });
    if (response.statusCode == 200) {
      print("data successfuly sent!");
    } else {
      print(response.statusCode.toString());
    }
    // _isLoading = false;
    update();
  }

  Future<void> deleteData(int taskID) async {
    _isLoading = true;
    update();
    Response response = await service.deleteData(
      '${HttpConstants.DELETE_TASK}' '?id=$taskID',
    );

    if (response.statusCode == 200) {
      print("Data DELETED");
    } else {
      print(response.statusCode.toString());
    }

    _isLoading = false;
    update();
  }
}
