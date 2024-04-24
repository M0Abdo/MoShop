// ignore_for_file: camel_case_types

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../../Date/Source/Remote/test_date.dart';

class test_controller extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack();
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        data.addAll(res["data"]);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

}
