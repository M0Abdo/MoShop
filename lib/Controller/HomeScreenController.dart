// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Veiw/Screen/bag.dart';
import '../Veiw/Screen/favorite.dart';
import '../Veiw/Screen/home.dart';
import '../Veiw/Screen/order.dart';
import '../Veiw/Screen/settings.dart';
import '../../Controller/CardController.dart';
import '../../Controller/HomeController.dart';
import '../../Controller/getFavoretController.dart';
import 'package:electronics_shop2/Controller/OrderController.dart';

class HomeScreenController extends GetxController {
  int curunetpage = 0;
  changePage(int i) {
    curunetpage = i;
    update();
  }

  deleteCon() {
    Get.delete<getFavoretController>();
    Get.delete<HomeController>();
    Get.delete<OrderController>();
    Get.delete<CardController>();
    update();
  }

  MyServices myServices = Get.find();
  List<Widget> listPage = [
    const home(),
    const favorite(),
    const bag(),
    const Order(),
    const settings(),
  ];
  @override
  void onInit() {
    if (Get.arguments == "card") {
      curunetpage = 2;
      update();
    } else if (Get.arguments == "order") {
      curunetpage = 3;
      update();
    } else if (Get.arguments == "setting") {
      curunetpage = 4;
      update();
    }
    super.onInit();
  }
}
