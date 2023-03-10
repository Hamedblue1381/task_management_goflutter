import 'package:get/get.dart';
import 'package:task_management_goflutter/constants/http_consts.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    // if (kDebugMode) {
    //   print(HttpConstants.BASE_URL + uri);
    // }

    Response response = await get(HttpConstants.BASE_URL + uri, headers: {
      'Content-Type': 'application/json charset=UTF-8',
    });

    return response;
  }

  Future<Response> postData(String uri, dynamic body) async {
    Response response =
        await post(HttpConstants.BASE_URL + uri, body, headers: {
      'Content-Type': 'application/json charset=UTF-8',
    });

    return response;
  }

  Future<Response> updateData(String uri, dynamic body) async {
    Response response = await put(HttpConstants.BASE_URL + uri, body, headers: {
      'Content-Type': 'application/json charset=UTF-8',
    });

    return response;
  }
}
