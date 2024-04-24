// ignore_for_file: camel_case_types, file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../Date/Source/Remote/orderdetails.dart';

class OrderDetailsController extends GetxController {
  OrderDetailsData testData = OrderDetailsData(Get.find());
  Map data = {};
  List items = [];
  int i = 0;
  Map<dynamic, dynamic> address = {};
  List<String> track1 = [
        "Order Under Review",
        "Out for Delivery ",
        "Order Recived"
      ],
      track2 = [
        "We have review your order",
        "Your order is ready and on the way",
        "Thank you for dealing with us"
      ];
  late StatusRequest statusRequest;
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    if (data["order_address"] != null) {
      var res = await testData.getDateFormBack(
          data["order_id"], data["order_address"]);

      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          items.addAll(res["data"]["items"]);
          address.addAll(res["data"]["address"]);
        } else {
          statusRequest = StatusRequest.fallure;
        }
      }
    } else {
      var res = await testData.getDateFormBackNull(data["order_id"]);

      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        if (res['status'] == "success") {
          items.addAll(res["data"]["items"]);
        } else {
          statusRequest = StatusRequest.fallure;
        }
      }
    }
    update();
  }

  @override
  void onInit() {
    data = Get.arguments["da"];
    i = Get.arguments["in"];
    getDateInApp();
    //getDateInApp();
    super.onInit();
  }
}
