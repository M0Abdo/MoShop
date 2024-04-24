// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/imgAssets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/ForgetController.dart';
import '../../../Controller/Color.dart';
import '../../../Core/Class/HandelData.dart';
import '../../Widget/ForgetPass/Buttom.dart';
import '../../Widget/ForgetPass/EmailFiled.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetController controller = Get.put(ForgetController());
    return Scaffold(
      body: HandelDataRequest(stateRequest: controller.statusRequest,widget:  GetBuilder<ForgetController>(builder: 
      (controller) {
        
      return Form(
        key: controller.formstate,
        child: ListView(
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
            color: Color.fromARGB(255, 0, 0, 0),
            size: 18.0,
          ),
        ),
                       ],
                     ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        bottom: 0.0,
                      ),
                      child: Text(
                        "28".tr,
                        style: const TextStyle(
                          fontSize: 30,
                          color: Appcolor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(ImgAsset.forgetImg),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "29".tr,
                        style: const TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "30".tr,
                        style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const EmailFiled(),
                    const ButtomForgetPass()
                  ],
                )),
          ],
        ),
      );
        }
      ,),),
    );
  }
}
