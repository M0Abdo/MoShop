// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemName extends StatelessWidget {
  final String name;
  final Function() onTap;
   const CustomItemName({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0),
                  child: Row(
                    children:  [
                      Text(
                        "$name 🔥",
                        style:  TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0.sp),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: onTap,
                        child:  Text(
                          "See All",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0.sp),
                        ),
                      )
                    ],
                  ),
                );
  }
}