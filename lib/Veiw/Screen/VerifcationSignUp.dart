// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/Auth/VerifcationSignUpController.dart';
import '../../Controller/Color.dart';
import '../../Controller/imgAssets.dart';
import '../Widget/VerifcationSingUp/otpTextField.dart';

class VerifcationSignUp extends StatelessWidget {
  const VerifcationSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifcationSignUpController());
    return GetBuilder<VerifcationSignUpController>(
      builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
            ),
          );
        }
        return Scaffold(
            body: ListView(
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
                            "${controller.email}",
                            style: const TextStyle(
                                color: Appcolor.primaryColor,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const otpTextField(),
                    Padding(
                      padding: const EdgeInsets.only(top: 17.0, bottom: 4.0),
                      child: Text("43".tr+" (${controller.c})",
                          style: const TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black38)),
                    ),
                  if(controller.c==30)   GestureDetector(
                      child:  Text(
                        "44".tr,
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
        ));
      },
    );
  }
}
