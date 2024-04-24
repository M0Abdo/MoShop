// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Hello extends StatelessWidget {
  const Hello({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height/3,
          child: Center(child: Text("0".tr,style: const TextStyle(fontSize: 90,color: Colors.white),textAlign: TextAlign.center,))),
      
                  Padding(
                    padding: const EdgeInsets.only(left:45.0,right: 45.0),
                    child: Row(
                      children: [
                        Text("7".tr,style: const TextStyle(fontSize: 20.0,color: Color.fromARGB(255, 114, 114, 114),fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )],
    );
  }
}