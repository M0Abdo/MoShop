// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Auth/CheckEmailController.dart';
import '../../../Controller/Color.dart';
import '../../../Controller/imgAssets.dart';
import '../../Widget/CheckEmail/otpTextFieldCheck.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(CheckEmailController());
    return Scaffold(
      body: GetBuilder<CheckEmailController>(builder: (controller) => ListView(
        children: [
          Container(
              // width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                           size: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      bottom: 0.0,
                    ),
                    child: Text(
                      "32".tr,
                      style: const TextStyle(
                        color: Appcolor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Image.asset(ImgAsset.VerilcodeImg),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      "33".tr,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 119, 118, 118),
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "34".tr,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 119, 118, 118),
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                         Text(
                          " ${controller.email}",
                          style:  const TextStyle(
                              color: Appcolor.primaryColor,
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  const otpTextFieldCheck(),
                  Padding(
                      padding: const EdgeInsets.only(top: 17.0, bottom: 4.0),
                      child: Text("Resend verification code (${controller.c})",
                          style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38)),
                    ),
                  if(controller.c==30)   GestureDetector(
                      child: const Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Appcolor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        if (controller.c == 30) {
                          controller.c = 0;
                          controller.startTimer();
                          controller.resend();
                        }
                      },
                    )
                ],
              )),
        ],
      ),),
    );
  }
}
