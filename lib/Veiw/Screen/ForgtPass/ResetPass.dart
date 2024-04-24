// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../Controller/Auth/ResetPassController.dart';
import '../../../Controller/Color.dart';
import '../../../Controller/imgAssets.dart';
import '../../Widget/ResetPass/CoPassFormField.dart';
import '../../Widget/ResetPass/PassFormFiled.dart';
import '../../Widget/ResetPass/Buttom.dart';

class RestPass extends StatelessWidget {
  const RestPass({super.key});

  @override
  Widget build(BuildContext context) {
    
    RestPassController controller =Get.put(RestPassController());
    return Scaffold(body: 
    Form(
      key: controller.formstate1,
          child: 
    GetBuilder<RestPassController>(
      builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return Center(
            child: Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
          );
        }
        return GetBuilder<RestPassController>(
            builder: (controller) {
              if (controller.statusRequest == StatusRequest.loading) {
                return Center(
                  child:
                      Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
                );
              }
              return ListView(
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
                          const PassFormField(),
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: CoPassFormField(),
                          ),
                        
                          const ButtomRestPass()
                        ],
                      )),
                ],
              );
            },
          
        );
      },
    )));
  }
}
