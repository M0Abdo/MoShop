// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../Controller/Color.dart';

Future<bool> AlertExitApp() {
  Get.defaultDialog(
    title: "Alert",
    titleStyle: const TextStyle(fontSize: 20.0,color: Appcolor.primaryColor),
    middleText: "Do you want to exit the app?",
    middleTextStyle: const TextStyle(fontSize: 18.0),
    actions: [
      GestureDetector(
        onTap: () {
          exit(0);
        },
        child: const Text(
          "Exit",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
           
          
          ),
        ),
      ),
      GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Text(
          "Cancel",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            
          
          ),
        ),
      ),
    ],
  );
  return Future.value(true);
}