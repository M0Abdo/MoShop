// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Auth/LogInController.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Core/Function/AlertExitApp.dart';
import '../Widget/login/Hello.dart';
import '../Widget/login/SignUpButtom.dart';
import '../Widget/login/SingInButtom.dart';
import '../Widget/login/SocielButtom.dart';
import '../Widget/login/formFiledEmail.dart';
import '../Widget/login/formFiledPass.dart';
import '../Widget/login/ForgetPassButtom.dart';

class login extends StatelessWidget {
  
  const login({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());
  
    return GetBuilder<LogInController>(
      builder: (controller) {
        return Scaffold(
            body: WillPopScope(
                onWillPop: AlertExitApp,
                child: HandelDataRequest(
                  widget: Form(
                    key: controller.formstate,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                         decoration:  const BoxDecoration(
                              color: Colors.white,
                            
                                image: DecorationImage(
                                            
                                    image: AssetImage(ImgAsset.backImg,),
                                    alignment: Alignment.topCenter)),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                         Column(
                           
                              children: [
                                const Hello(),
                                
                                const formFiledEmail(),
                                const formFiledPass(),
                                const ForgetPassButtom(),
                                SingInButtom(),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 35.0, bottom: 15.0),
                                  child: Text(
                                    "11".tr,
                                    style: const TextStyle(color: Colors.black26),
                                  ),
                                ),
                                const SocialButtom(),
                                const SignUpButtom()
                              ],
                            ),
                          
                        ],)
                      ),
                    ),
                  
                  stateRequest: controller.statusRequest,
                )));
      },
    );
  }
}
