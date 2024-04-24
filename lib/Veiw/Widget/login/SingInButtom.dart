// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/LogInController.dart';
import '../../../Controller/Color.dart';

class SingInButtom extends GetView<LogInController> {
   SingInButtom({super.key});
   @override
     LogInController controller= Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GestureDetector(
          onTap: () {
            controller.GoToSingIn();
          },
          child: Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
                color: Appcolor.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "10".tr,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  ),
            )),
          )),
    );
  }
}
