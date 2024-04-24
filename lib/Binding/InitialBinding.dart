// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/Crud.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
