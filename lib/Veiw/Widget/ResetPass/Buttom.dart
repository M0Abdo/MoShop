// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/ResetPassController.dart';
import '../../../Controller/Color.dart';

class ButtomRestPass extends StatelessWidget {
  const ButtomRestPass({super.key});

  @override
  Widget build(BuildContext context) {
    RestPassController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: GestureDetector(
          onTap: () {
            controller.GoToSuccess();
          },
          child: Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Appcolor.primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "37".tr,
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
