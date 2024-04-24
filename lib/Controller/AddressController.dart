// ignore_for_file: camel_case_types, file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/address.dart';

class AddressController extends GetxController {
  AddressData testData = AddressData(Get.find());
  List data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest2, statusRequest;
  getDateInApp() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack(
        myServices.sharedPreferences.getString("id") as String);
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

  deleteData(int index) async {
    statusRequest2 = StatusRequest.loading;
    var res = await testData.deletAddrss(data[index]["address_id"]);
    statusRequest2 = handleData(res);
    if (statusRequest2 == StatusRequest.success) {
      if (res['status'] == "success") {
        data.removeWhere(
            (element) => element["address_id"] == data[index]["address_id"]);
      } else {
        statusRequest2 = StatusRequest.fallure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDateInApp();
    super.onInit();
  }
}
