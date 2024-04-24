// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/Auth/SignUpController.dart';
import '../../../Controller/Color.dart';
import '../../../Core/Function/ValidInput.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller=Get.find();
    return Padding(
                        padding: const EdgeInsets.only(left:50.0,right: 50.0,top: 25.0),
                        child: TextFormField(
                          validator: (value) {
        return  validInput(
            value!,5,100,"ُEmail"
          );
        },                        controller:controller.emailControler ,
                          textInputAction: TextInputAction.next,
                          cursorColor: const Color.fromARGB(255, 0, 0, 0),
                          decoration: InputDecoration(
                             errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0)) 
                            ),
                            focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 215, 0, 0)) 
                            ),
                            suffixIcon: const Icon(Icons.email_outlined,),
                            suffixIconColor: Appcolor.primaryColor,
                              floatingLabelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            label: Text("8".tr,style: const TextStyle(fontWeight: FontWeight.bold)),
                            contentPadding: const EdgeInsets.only(right: 15.0,left: 15.0),
                            hintText: "21".tr,
                             floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12) 
                            ),
                            focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)) 
                            ),
                          ),
                        ),
                      );
  }
}