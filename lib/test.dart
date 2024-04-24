// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/Auth/tesc_controller.dart';
import 'Core/Class/HandelData.dart';

class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(test_controller());
    return Scaffold(
      body: GetBuilder<test_controller>(
        builder: (controller) {
         return HandelData(stateRequest: controller.statusRequest,widget: ListView.builder(
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
            itemCount: controller.data.length,
          ));
          
        },
      ),
    );
  }
}
