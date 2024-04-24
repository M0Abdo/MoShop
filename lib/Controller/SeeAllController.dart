// ignore_for_file: camel_case_types, file_names

import 'package:get/get.dart';


class SeeAllController extends GetxController {
  List data = [];

  @override
  void onInit() {
    data = Get.arguments;
    super.onInit();
  }
}
