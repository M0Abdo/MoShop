// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../Controller/Color.dart';
import '../../../Controller/ResetPassUser/ResetPassVerController.dart';

class ResetPassVar extends StatelessWidget {
  const ResetPassVar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPassControllerVar());
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 18.0,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: GetBuilder<ResetPassControllerVar>(
            builder: (controller) => HandelDataRequest(
                  stateRequest: controller.statusRequest!,
                  widget: Container(
                    height: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ListView(
                      padding: const EdgeInsets.only(top: 80.0),
                      shrinkWrap: true,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Text(
                            "Enter Old Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 119, 118, 118),
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: TextFormField(
                            controller: controller.Pass,
                            textInputAction: TextInputAction.done,
                            cursorColor: const Color.fromARGB(255, 0, 0, 0),
                            obscureText: (controller.f) ? false : true,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                child: (controller.f)
                                    ? const Icon(
                                        Icons.visibility,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                      ),
                                onTap: () {
                                  controller.SeeHied();
                                },
                              ),
                              suffixIconColor: Appcolor.primaryColor,
                              floatingLabelStyle: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              contentPadding: const EdgeInsets.only(
                                  right: 15.0, left: 15.0),
                              hintText: "Old Password",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black12)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 0, 0, 0))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.getDateInApp();
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Center(
                                          child: Text(
                                        "Reset Password",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      )),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 2,
                                color: Colors.black26,
                                width: 50,
                              ),
                              const Text(
                                " OR ",
                                style: TextStyle(color: Colors.black26),
                              ),
                              Container(
                                height: 2,
                                color: Colors.black26,
                                width: 50,
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Text(
                            "Enter Code We Sent ",
                            style: TextStyle(
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
                                " ${controller.myServices.sharedPreferences.getString("email")!}",
                                style: const TextStyle(
                                    color: Appcolor.primaryColor,
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        OtpTextField(
                          numberOfFields: 4,
                          borderColor: Colors.black,
                          focusedBorderColor: Appcolor.primaryColor,
                          showFieldAsBox: false,
                          cursorColor: Colors.black,
                          textStyle: const TextStyle(fontSize: 20.0),
                          borderWidth: 4.0,
                          onCodeChanged: (String code) {},
                          onSubmit: (String verificationCode) {
                            controller.checkCode(verificationCode);
                          },
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 17.0, bottom: 4.0),
                              child: Text(
                                  "Resend verification code (${controller.c})",
                                  style: const TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black38)),
                            ),
                            if (controller.c == 30)
                              GestureDetector(
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
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
