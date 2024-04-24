// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Date/Source/Remote/SignUpData.dart';
import '../AppRoute.dart';

class SignUpController extends GetxController {
  bool f = false,f2=false;
  String gender="0";
  TextEditingController userControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController CoControler = TextEditingController();
  TextEditingController passControler = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signuoData = SignUpData(Get.find());
  MyServices myServices = Get.find();
  getDateInApp() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await signuoData.postdata(
        userControler.text, emailControler.text, passControler.text,gender);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        Get.toNamed(AppRoute.VerifcationSignUp,
            arguments: {"email": emailControler.text});
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Email Alrady Exists");
      }
    }
    update();
  }

  up(String x) {
    gender = x;
    update();
  }

  Creat() {
    var formst = formstate.currentState;
    if (formst!.validate()) {
      getDateInApp();
    } else {}
  }

  SeeHied(int x) {
    if(x==1){if (f == true) {
      f = false;
    } else {
      f = true;
    }}else {
if (f2 == true) {
      f2 = false;
    } else {
      f2 = true;
    }
    }

    update();
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  GoogleSignTn() async {
    await signInWithGoogle();
    statusRequest = StatusRequest.loading;

    var res = await signuoData.signupgoogle(
        FirebaseAuth.instance.currentUser!.displayName.toString(),
        FirebaseAuth.instance.currentUser!.email.toString());
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      myServices.sharedPreferences
          .setString("id", "${res['data']?['users_id']}");
      myServices.sharedPreferences
          .setString("username", "${res['data']?['users_name']}");
      myServices.sharedPreferences
          .setString("email", "${res['data']?['users_email']}");
      myServices.sharedPreferences.setString("check", "2");
      myServices.sharedPreferences
            .setString("gen", "${res['data']?['user_gen']}");
      FirebaseMessaging.instance.subscribeToTopic("user");
      FirebaseMessaging.instance
          .subscribeToTopic("user${res['data']?['users_id']}");
      Get.offAllNamed(AppRoute.Home,);
    }
    update();
  }

  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    OAuthCredential? facebookAuthCredential;
    try {
      facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on Exception {
      return null;
    }

    // Once signed in, return the UserCredential
  }

  FacebookSignTn() async {
    await signInWithFacebook();

    if (FirebaseAuth.instance.currentUser != null) {
      statusRequest = StatusRequest.loading;

      var res = await signuoData.signupgoogle(
          FirebaseAuth.instance.currentUser!.displayName.toString(),
          FirebaseAuth.instance.currentUser!.email.toString());
      statusRequest = handleData(res);
      if (statusRequest == StatusRequest.success) {
        myServices.sharedPreferences
            .setString("id", "${res['data']?['users_id']}");
        myServices.sharedPreferences
            .setString("username", "${res['data']?['users_name']}");
        myServices.sharedPreferences
            .setString("email", "${res['data']?['users_email']}");
        myServices.sharedPreferences.setString("check", "2");
        myServices.sharedPreferences
            .setString("gen", "${res['data']?['user_gen']}");
        FirebaseMessaging.instance.subscribeToTopic("user");
        FirebaseMessaging.instance
            .subscribeToTopic("user${res['data']?['users_id']}");
        Get.offAllNamed(AppRoute.Home);
      }
      update();
    }
  }
}
