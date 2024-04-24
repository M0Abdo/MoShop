// ignore_for_file: camel_case_types

import 'package:electronics_shop2/Controller/Color.dart';
import 'package:electronics_shop2/Veiw/Screen/ResetPassUser/ResetPassVar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:electronics_shop2/Core/Localization/changeLocal.dart';
import '../../Controller/SettingController.dart';
import '../../Controller/imgAssets.dart';
import 'Address.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return GetBuilder<SettingController>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color.fromARGB(255, 7, 7, 155),
                  child: Center(
                    child: Image.asset(
                        (controller.myServices.sharedPreferences
                                    .getString("gen") ==
                                "0")
                            ? ImgAsset.BoyImg
                            : ImgAsset.GirlImg,
                        height: 100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: Text(
                  "${controller.myServices.sharedPreferences.getString("username")}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(const Address(), transition: Transition.downToUp);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(163, 242, 242, 242),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Color.fromARGB(255, 0, 8, 99),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Text(
                                "Address",
                                style: TextStyle(fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(const ResetPassVar(),
                            transition: Transition.downToUp);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(163, 242, 242, 242),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.password,
                                color: Color.fromARGB(255, 0, 8, 99),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Text(
                                "Reset Password",
                                style: TextStyle(fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(163, 242, 242, 242),
                          borderRadius: BorderRadius.circular(8.0)),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Icon(
                              Icons.language,
                              color: Color.fromARGB(255, 0, 8, 99),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Text(
                              (controller.myServices.sharedPreferences
                                          .getString("lang") ==
                                      "ar")
                                  ? "Engelish"
                                  : "عربى",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              print('object');
                              controller.chang();
                            },
                            child: Container(alignment: Alignment.center,
                            child: Text( (controller.myServices.sharedPreferences
                                          .getString("lang") ==
                                      "ar")
                                  ? "Press her"
                                  : "اضغط هنا",style: TextStyle(color: Appcolor.primaryColor,fontWeight: FontWeight.bold,),),
                              height: 50,width: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.logout();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(163, 242, 242, 242),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.logout_rounded,
                                color: Color.fromARGB(255, 0, 8, 99),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Text(
                                "Logout",
                                style: TextStyle(fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () async {
                        controller.sendWhat();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(163, 242, 242, 242),
                            borderRadius: BorderRadius.circular(8.0)),
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Icon(
                                Icons.chat_outlined,
                                color: Color.fromARGB(255, 0, 8, 99),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0, left: 8.0),
                              child: Text(
                                "Countact us",
                                style: TextStyle(fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(163, 242, 242, 242),
                          borderRadius: BorderRadius.circular(8.0)),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Icon(
                              Icons.help_outline,
                              color: Color.fromARGB(255, 0, 8, 99),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0, left: 8.0),
                            child: Text(
                              "About us",
                              style: TextStyle(fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
