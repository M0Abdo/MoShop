// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../Controller/Color.dart';


class ShopName extends StatelessWidget {
  const ShopName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                 Text(
                        "Mo",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: Appcolor.primaryColor,
                        ),
                      ),
                      Text("Shop",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                          )),
                ],
              ),
            );
  }
}