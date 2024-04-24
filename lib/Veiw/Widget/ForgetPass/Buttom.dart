// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/ForgetController.dart';
import '../../../Controller/Color.dart';

class ButtomForgetPass extends StatelessWidget {
  const ButtomForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: GestureDetector(
          onTap: () {
            controller.GoToCheckEmail();
          },
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                color: Appcolor.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "31".tr,
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
