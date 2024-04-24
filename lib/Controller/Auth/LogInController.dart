// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Date/Source/Remote/LogIn.dart';
import '../AppRoute.dart';
import '../../Core/Services/services.dart';

class LogInController extends GetxController {
  TextEditingController? emailControler = TextEditingController();
  TextEditingController? passControler = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  LogInData signuoData = LogInData(Get.find());
  MyServices myServices = Get.find();

  getDateInApp() async {
    print(';;;;;');
    statusRequest = StatusRequest.loading;
    update();
    var res = await signuoData.postdata(
        emailControler?.text ?? '', passControler?.text ?? '');
    print(res);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        if (res['data']['users_approve'] == '1') {
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
        } else {
          Get.toNamed(AppRoute.VerifcationSignUp,
              arguments: {"email": res['data']['users_email']});
        }
      } else {
        Get.defaultDialog(
          title: "Warning",
          middleText: "Email or Password is Wrong",
        );
      }
    }
    update();
  }

  bool f = false;

  GoToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  GoToSingIn() {
    var formst = formstate.currentState;
    if (formst!.validate()) {
      getDateInApp();
    } else {
      // Handle form validation failure
    }
  }

  SeeHied() {
    f = !f;
    update();
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    var credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  GoogleSignTn() async {
    await signInWithGoogle();
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
        myServices.sharedPreferences
            .setString("gen", "${res['data']?['user_gen']}");
        myServices.sharedPreferences.setString("check", "2");

        FirebaseMessaging.instance.subscribeToTopic("user");
        FirebaseMessaging.instance
            .subscribeToTopic("user${res['data']?['users_id']}");

        Get.offAllNamed(AppRoute.Home);
      }
      update();
    }
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
