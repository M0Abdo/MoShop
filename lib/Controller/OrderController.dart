// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Class/statusRequest.dart';
import '../Core/Function/handleData.dart';
import '../Core/Services/services.dart';
import '../Date/Source/Remote/order.dart';
import '../Veiw/Screen/OrderDetails.dart';
import '../Veiw/Widget/Order/History.dart';
import '../Veiw/Widget/Order/Next.dart';

class OrderController extends GetxController {
  OrderData testData = OrderData(Get.find());
  List nextdata = [], historydata = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  getDateInApp() async {
    nextdata.clear();
    historydata.clear();
    statusRequest = StatusRequest.loading;
    var res = await testData.getDateFormBack(
        myServices.sharedPreferences.getString("id").toString());
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        nextdata.addAll(res["data"]["next"]);
        historydata.addAll(res["data"]["history"]);
      
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }
 Go(int index,i){
  if(i==1) {
    Get.to(const OrderDetails(),arguments: {"da": nextdata[index],"in":index},transition: Transition.leftToRight);
  } else{
    Get.to(const OrderDetails(),arguments: {"da": historydata[index],"in":index},transition: Transition.leftToRight);
   }
 }
  delete(int i) async {
    statusRequest = StatusRequest.loading;
    var res = await testData.delete(nextdata[i]["order_id"]);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        nextdata.removeAt(i);
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }
  
  deleteHistory() async {
    nextdata.clear();
    historydata.clear();
    statusRequest = StatusRequest.loading;
    var res = await testData
        .deleteHistory(myServices.sharedPreferences.getString("id").toString());
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        historydata.clear();
      } else {
        statusRequest = StatusRequest.fallure;
      }
    }
    update();
  }

  int select = 0;
  changeSel(int i) {
    select = i;
    update();
  }

  List<Widget> listOrder = [const NextOrder(), const HistoryOrder()];
  @override
  void onInit() {
    getDateInApp();

    super.onInit();
  }
}
