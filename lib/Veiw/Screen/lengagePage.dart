// ignore_for_file: file_names, camel_case_types, must_be_immutable

import 'package:electronics_shop2/Core/Localization/changeLocal.dart';
import 'package:electronics_shop2/Core/Services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AppRoute.dart';
import '../../Controller/Color.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Function/AlertExitApp.dart';

class lengagePage extends GetView<changeLocal> {
  lengagePage({super.key});

  changeLocal controllerLang = Get.put(changeLocal());
  MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: 
       AlertExitApp,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Mo",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Appcolor.primaryColor,
                        ),
                      ),
                      Text("Shop",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          )),
                     
                    ],
                  ),
                ),
                Image.asset(
                  ImgAsset.translationImg,
                  //height: 320,
                  //width: 320,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("1".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.changLang("en");
                    Get.offAllNamed(AppRoute.onBoarding);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              height: 50,
                              width: 148,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Appcolor.primaryColor),
                              child: const Center(
                                  child: Text(
                                "English",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.changLang("ar");
                            myServices.sharedPreferences
                                .setString("choose", "1");
                            Get.offAllNamed(AppRoute.onBoarding);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 148,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Appcolor.primaryColor),
                                child: const Padding(
                                  padding: EdgeInsets.only(bottom: 9.0),
                                  child: Center(
                                      child: Text(
                                    "عربي",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo",
                                        color: Colors.white),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      )
      
    ));
  }
}
