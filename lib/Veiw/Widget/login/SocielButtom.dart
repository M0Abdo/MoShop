// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/Auth/LogInController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/imgAssets.dart';

class SocialButtom extends StatelessWidget {
  const SocialButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogInController>(
      builder: (controller) => Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                controller.FacebookSignTn();
              },
              child: Container(
                height: 47,
                width: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    )
                  ],
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.asset(
                  ImgAsset.faceBookImg,
                  height: 48,
                  width: 58,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              controller.GoogleSignTn();
            },
            child: Container(
              height: 47,
              width: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  )
                ],
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(
                ImgAsset.googleImg,
                height: 48,
                width: 58,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
