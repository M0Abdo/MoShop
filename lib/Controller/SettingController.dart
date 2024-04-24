// ignore_for_file: camel_case_types, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Core/Localization/changeLocal.dart';
import '../Core/Services/services.dart';
import 'AppRoute.dart';

class SettingController extends GetxController {
  MyServices myServices = Get.find();
  changeLocal changLg = changeLocal();
  var ch = false.obs;
  chang() {
    ch.value = !ch.value;
    MyLang();
    update();
  }

  MyLang() {
    if (myServices.sharedPreferences.getString("lang") == "ar")
      changLg.changLang('en');
    else
      changLg.changLang('ar');

    print(myServices.sharedPreferences.getString("lang"));
  }

  logout() {
    Get.defaultDialog(
        title: "Logout",
        titleStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 0, 8, 99)),
        middleText: "Are you sure to logout?",
        middleTextStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        actions: [
          const Spacer(),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut();

              FirebaseMessaging.instance.subscribeToTopic("user");
              FirebaseMessaging.instance.subscribeToTopic(
                  "user${myServices.sharedPreferences.getString("id")}");
              myServices.sharedPreferences.setString("id", "");
              myServices.sharedPreferences.setString("username", "");
              myServices.sharedPreferences.setString("gen", "");
              myServices.sharedPreferences.setString("email", "");
              myServices.sharedPreferences.setString("check", "1");
              Get.offAllNamed(AppRoute.login);
            },
            child: const SizedBox(
                height: 20,
                width: 50,
                child: Text(
                  "Logout",
                )),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const SizedBox(
                width: 50,
                height: 20,
                child: Text(
                  "Canel",
                )),
          ),
          const Spacer()
        ]);
  }

  sendWhat() async {
    String whatsappURlAndroid = "whatsapp://send?phone=201154930344";

    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
    } else {}
  }
}
