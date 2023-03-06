import 'package:get/get.dart';
import 'package:task_management_goflutter/services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got the data ");
      update();
    } else {
      print("No data");
    }
  }

  Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData({
      "task_name": task,
      "taskDetail": taskDetail,
    });
    if (response.statusCode == 200) {
      // _myData = response.body;
      print("data successfuly sent!");
      update();
    } else {
      print("no data sent");
    }
  }
}
