// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/Auth/LogInController.dart';

class SignUpButtom extends StatelessWidget {
  const SignUpButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("12".tr, style: const TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black38)),
          GestureDetector(
              onTap: () {
                LogInController().GoToSignUp();
              },
              child: Text(
                "13".tr,
                style: const TextStyle(
                  fontSize: 15.0,
                    color: Color.fromARGB(201, 61, 70, 172), fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
