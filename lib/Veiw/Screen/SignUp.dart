// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Auth/SignUpController.dart';
import 'package:electronics_shop2/Controller/Color.dart';
import 'package:electronics_shop2/Core/Class/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Core/Function/translateDatabase.dart';
import '../Widget/SignUp/CoPassFormField.dart';
import '../Widget/SignUp/CreateButtom.dart';
import '../Widget/SignUp/PhoneFormField.dart';
import '../Widget/SignUp/PassFormField.dart';
import '../Widget/SignUp/SocielButtom.dart';
import '../Widget/SignUp/Texts.dart';
import '../Widget/SignUp/UserFormField.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.put(SignUpController());
    return Scaffold(
      body: HandelDataRequest(
        stateRequest: controller.statusRequest,
        widget: Form(
          key: controller.formstate,
          child: GetBuilder<SignUpController>(
            builder: (controller) {
              if (controller.statusRequest == StatusRequest.loading) {
                return Center(
                  child:
                      Lottie.asset(ImgAsset.Loading, height: 180, width: 180),
                );
              }
              return Container(
                  decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImgAsset.backImg),
                            alignment: Alignment.topCenter)),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child:  Icon(
                                  translateDatabase(Icons.arrow_forward_ios,Icons.arrow_back_ios,) ,
                                  color: Colors.white,
                                  size: 18.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Texts(),
                        const UserFormField(),
                        const PhoneFormField(),
                        const PassFormField(),
                        const CoPassFormField(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                               activeColor: Appcolor.primaryColor,
                              value: "0",
                              groupValue: controller.gender,
                              onChanged: (value) {
                                controller.up(value!);
                              },
                            ),
                             Text(
                              "41".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                            Radio(
                              activeColor: Appcolor.primaryColor,
                              value: "1",
                              groupValue: controller.gender,
                              onChanged: (value) {
                                 controller.up(value!);
                              },
                            ),
                             Text(
                              "42".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                          ],
                        ),
                        CreateButtom(),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 35.0, bottom: 15.0),
                          child: Text(
                            "26".tr,
                            style: const TextStyle(color: Colors.black26),
                          ),
                        ),
                        const SocielButtom()
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
