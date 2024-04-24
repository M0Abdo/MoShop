// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Auth/onboardingControl.dart';
import 'package:flutter/material.dart';


import '../../Core/Function/AlertExitApp.dart';
import '../Widget/onBoarding/ButtomStart.dart';
import '../Widget/onBoarding/Dots.dart';
import '../Widget/onBoarding/ShopName.dart';
import '../Widget/onBoarding/Texts.dart';
import '../Widget/onBoarding/img.dart';
import 'package:get/get.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});
  
  @override
 
  Widget build(BuildContext context) { 
    Get.put(onboardingContronlImp());
    return Scaffold(
        body: WillPopScope(onWillPop: AlertExitApp, child: Container(
          width: double.infinity,
        height: double.infinity,
        color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                  ShopName(),
                   Img(),
                  ],
                ),
              ), 
              Expanded(
                child: Column(
                  children: const[
                      Texts(), Dots(),ButtomStart(),
                  ],
                ),
              )
            ],
          ),
        ))
        
        );
  }
}
