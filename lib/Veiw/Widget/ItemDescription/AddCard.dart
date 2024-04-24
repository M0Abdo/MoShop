// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Controller/CardController.dart';
import '../../../Controller/Color.dart';

class AddCard extends StatelessWidget {
  final String count;
  final String itemId;
  const AddCard({super.key, required this.count, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CardController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.getDateInApp(itemId, count);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Appcolor.primaryColor,
              borderRadius: BorderRadius.circular(15)),
          height: 50,
          width: 180,
          child: const Center(
            child: Text(
              "Add to Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 238, 238, 238),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
