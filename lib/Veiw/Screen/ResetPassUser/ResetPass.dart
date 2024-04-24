// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


import '../../../Controller/Color.dart';
import '../../../Controller/ResetPassUser/ResetPassController.dart';
import '../../../Controller/imgAssets.dart';
import '../../../Core/Function/ValidInput.dart';

class ResetPass extends StatelessWidget {
  const ResetPass({super.key});

  @override
  Widget build(BuildContext context) {
    
    ResetPassController controller =Get.put(ResetPassController());
    return Scaffold(
     appBar: AppBar(leading:  GestureDetector(
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
      body: 
    Form(
      key: controller.formstate1,
          child: 
    GetBuilder<ResetPassController>(
      builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return Center(
            child: Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
          );
        }
        return GetBuilder<ResetPassController>(
            builder: (controller) {
              if (controller.statusRequest == StatusRequest.loading) {
                return Center(
                  child:
                      Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
                );
              }
              return Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    Container(
                        // width: double.infinity,
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 40.0,
                                bottom: 0.0,
                              ),
                              child: Text(
                                "35".tr,
                                style: const TextStyle(
                                  color: Appcolor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 40.0, bottom: 50.0),
                              child: Text(
                                "36".tr,
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 119, 118, 118),
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                             GetBuilder<ResetPassController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          controller: controller.Pass,
                          validator: (value) {
                return validInput(value!, 5, 100, "Password");
                          },
                          textInputAction: TextInputAction.next,
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
                floatingLabelStyle:
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                label: Text("9".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
                hintText: "22".tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ),
                      );
                    },
                  ),
                             Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child:GetBuilder<ResetPassController>(
                    builder: (controller) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          controller: controller.coPass,
                          cursorColor: const Color.fromARGB(255, 0, 0, 0),
                          validator: (value) {
                if (controller.Pass.text.isNotEmpty) {
                  if (controller.Pass.text != controller.coPass.text) {
                    return "Confirm password not equal to password";
                  }
                } else {
                  return "Please enter the filed data";
                }
                return null;
                          },
                           textInputAction: TextInputAction.done,
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
                floatingLabelStyle:
                    const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                label: Text("23".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
                hintText: "24".tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                        ),
                      );
                    },
                  ),
                            ),
                          
                           Padding(
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
                    fontFamily: "Play"),
                          )),
                        )),
                  )
                          ],
                        )),
                  ],
                ),
              );
            },
          
        );
      },
    )));
  }
}
