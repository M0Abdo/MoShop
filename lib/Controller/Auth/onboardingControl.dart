// ignore_for_file: file_names, camel_case_types, overridden_fields

import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../Date/Source/Static/static.dart';
import '../AppRoute.dart';

abstract class onboardingContronl extends GetxController {
  int currentPage = 0;
  onPageChange(int i) {}
  next() {}
}

class onboardingContronlImp extends onboardingContronl {
  @override
  int currentPage = 0;
  late PageController pageController;
  @override
  onPageChange(int i) {
    currentPage = i;
    update();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      MyServices myServices = Get.find();
      myServices.sharedPreferences.setString("check", "1");
      Get.offAllNamed(AppRoute.login);
    }
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 900), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
