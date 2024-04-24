// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names, unrelated_type_equality_checks

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:get/get.dart';

import '../../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/checkout.dart';
import '../Veiw/Screen/SeccessOrder.dart';

class CheckOutController extends GetxController {
  CheckOut testData = CheckOut(Get.find());
  List address = [], items = [];
  MyServices myServices = Get.find();
  int total = 0, discount = 0, addressI = -1, type = -1;
  late StatusRequest statusRequest = StatusRequest.none;
  getDateInApp() async {address = [];
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack(
        myServices.sharedPreferences.getString("id") as String);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        address.addAll(res["data"]["address"]);
       
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  changeAddressI(int i) {
    addressI = i;
    update();
  }

  changeType(int w) {
    type = w;
    update();
  }

  GoToSeccess() async {
    statusRequest = StatusRequest.loading;
      if(type==0)
   { var res2 = await testData.addAddress(
        total.toString(),
        address[addressI]["address_id"],
         address[addressI]["address_cost"],
         discount.toString(),
        myServices.sharedPreferences.getString("id") as String);
    statusRequest = handleData(res2);
    if (statusRequest == StatusRequest.success) {
      if (res2['status'] == "success") {
        Get.off(const SeccessOrder());
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }}else {
      var res2 = await testData.addAddressNull(
        total.toString(),
        
   

        (discount == 0) ? "0" : discount.toString(),
        myServices.sharedPreferences.getString("id") as String);
    statusRequest = handleData(res2);
    if (statusRequest == StatusRequest.success) {
      if (res2['status'] == "success") {
        Get.off(const SeccessOrder());
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    }
    update();
  }

  @override
  void onInit() {
    if(Get.arguments!=null)
    {discount = Get.arguments["dis"];
    items = Get.arguments["it"];
    total=Get.arguments["to"];}
    if (discount == Null) {
      discount = 0;
    }
    getDateInApp();
    super.onInit();
  }
}
