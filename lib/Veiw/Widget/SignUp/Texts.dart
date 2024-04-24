// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Texts extends StatelessWidget {
  const Texts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
              height: MediaQuery.of(context).size.height/4,
            child: Center(child: Text("17".tr,style: const TextStyle(fontSize: 50,color: Colors.white),textAlign: TextAlign.center,))),
                Padding(
                    padding: const EdgeInsets.only(left:45.0,right: 45.0),
                    child: Row(
                      children: [
                        Text("18".tr,style: const TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 114, 114, 114),fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
      ],
    );
  }
}
