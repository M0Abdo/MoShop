// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AddDerliveryRatingController.dart';
import '../../Controller/Color.dart';

class AddDerliveryRating extends StatelessWidget {
  const AddDerliveryRating({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDerliveryRatingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 18.0,
          ),
        ),
      ),
      body: GetBuilder<AddDerliveryRatingController>(
        builder: (controller) => HandelDataRequest(
            stateRequest: controller.statusRequest,
            widget: Container(
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "What is your rating in delivery man?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  controller.up(index);
                                },
                                child: (index <= controller.indexRating)
                                    ? const Icon(Icons.star,
                                        size: 40,
                                        color: Color.fromARGB(255, 255, 166, 0))
                                    : const Icon(
                                        Icons.star_border,
                                        size: 40,
                                      )),
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                         // maxLines: 7,
                          minLines: 1,
                          controller: controller.details,
                          textInputAction: TextInputAction.done,
                          cursorColor: const Color.fromARGB(255, 0, 0, 0),
                          decoration: const InputDecoration(
                            errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 255, 0, 0))),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 215, 0, 0))),
                            floatingLabelStyle:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            contentPadding:
                                EdgeInsets.only(right: 15.0, left: 15.0),
                            hintText: "Commants",
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide:
                                    BorderSide(color: Appcolor.primaryColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.addRarting();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Appcolor.primaryColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 50,
                                  width: 150,
                                  child: const Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 238, 238, 238),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
