// ignore_for_file: file_names


import 'package:electronics_shop2/Controller/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CustomItemName.dart';

class CustomItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  const CustomItem({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Column(
          children: [
            CustomItemName(
              name: "$title 🔥",
              onTap: onTap,
            ),
            
          ],
        );
      },
    );
  }
}
