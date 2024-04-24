// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'Veiw/test.dart';

class test2 extends StatelessWidget {
  const test2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          GestureDetector(
            onTap: () {
                      Get.back();
                    },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(255, 13, 255, 0),
              child: Center(child: Container(height: 50,width: 100,color: Colors.white, child: Center(child: Text("Back")),)),
            ),
          ),
         
        ],
      ),
    );
  }
}
