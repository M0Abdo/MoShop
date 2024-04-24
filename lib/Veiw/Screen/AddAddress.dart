// ignore_for_file: file_names, must_be_immutable, library_private_types_in_public_api

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:electronics_shop2/Controller/Color.dart';
import '../../Controller/AddAddressController.dart';
import '../../Controller/imgAssets.dart';
import '../../Core/Class/HandelData.dart';
import '../../Core/Function/ValidInput.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
 
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
    
      body:
               GetBuilder<AddAddressController>(
        builder: (controller) =>  HandelData(stateRequest: controller.statusRequest,widget: Form(
          key: controller.formstate,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 15,
            ),
            child: ListView(children: [
              Row(children: [
                           GestureDetector(
          onTap: () {
             Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 18.0,
          ),
        ),const Spacer(),
        const Text(
          "Add New Address",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21.0),
        ),
        const Spacer()
              ],),
              Container(
                color: Colors.white,
                child: Center(
                  child: Lottie.asset(ImgAsset.Location,
                      height: 260, width: 280, repeat: false),
                ),
              ),
              Row(children: [
                const Expanded(
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    validator: (value) =>  validInput(value!, 1, 100, ""),
                    controller: controller.addressname,
                    textInputAction: TextInputAction.next,
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 0))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 215, 0, 0))),
                      suffixIconColor: Appcolor.primaryColor,
                      floatingLabelStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      contentPadding:
                          EdgeInsets.only(right: 15.0, left: 15.0),
                      hintText: "Enter Address Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder:  OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide:
                                  BorderSide(color: Colors.black)),
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(children: [
                  const Expanded(
                    child: Text(
                      "Receiver",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      validator: (value) =>  validInput(value!, 1, 100, ""),
                      controller: controller.name,
                      textInputAction: TextInputAction.next,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 0))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 215, 0, 0))),
                        suffixIconColor: Appcolor.primaryColor,
                        floatingLabelStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        contentPadding:
                            EdgeInsets.only(right: 15.0, left: 15.0),
                        hintText: "Enter Receiver Name",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                         enabledBorder:  OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide:
                                  BorderSide(color: Colors.black)),
                      ),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(children: [
                  const Expanded(
                    child: Text(
                      "Phone ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                       validator: (value) =>  validInput(value!, 1, 100, ""),
                      controller: controller.phone,
                      textInputAction: TextInputAction.done,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 0))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 215, 0, 0))),
                        suffixIconColor: Appcolor.primaryColor,
                        floatingLabelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        contentPadding:
                            EdgeInsets.only(right: 15.0, left: 15.0),
                        hintText: "Enter Phone",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder:  OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide:
                                  BorderSide(color: Colors.black)),
                      ),
                    ),
                  )
                ]),
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "City ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: AppTextField(
                        cities: controller.dataBox,
                        
                        hint: "Select City",
                        isCitySelected: true),
                  ),
                ],
              ),
              Row(children: [
                const Expanded(
                  child: Text(
                    "Rigon ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextFormField(
                     validator: (value) =>  validInput(value!, 1, 100, ""),
                    controller: controller.rigon,
                    textInputAction: TextInputAction.next,
                    cursorColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: const InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 0, 0))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 215, 0, 0))),
                      suffixIconColor: Appcolor.primaryColor,
                      floatingLabelStyle:
                          TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      contentPadding:
                          EdgeInsets.only(right: 15.0, left: 15.0),
                      hintText: "Enter Rigon",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                     enabledBorder:  OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide:
                                  BorderSide(color: Colors.black)),
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(children: [
                  const Expanded(
                    child: Text(
                      "Details ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                       validator: (value) =>  validInput(value!, 1, 100, ""),
                      controller: controller.details,
                      textInputAction: TextInputAction.done,
                      cursorColor: const Color.fromARGB(255, 0, 0, 0),
                      decoration: const InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 0, 0))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 215, 0, 0))),
                        suffixIconColor: Appcolor.primaryColor,
                        floatingLabelStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                        contentPadding:
                            EdgeInsets.only(right: 15.0, left: 15.0),
                        hintText: "Enter Details",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        enabledBorder:  OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                          borderSide:
                                  BorderSide(color: Colors.black)),
                      ),
                    ),
                  )
                ]),
              ),
              if (controller.city.text != "")
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Delivery cost is ${controller.cityTOcost[controller.city.text]}\$",
                    style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  controller.addAddress();
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0,bottom: 15.0),
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color.fromARGB(255, 0, 8, 99),
                        ),
                        child: const Center(
                            child: Text(
                          "Add Adress",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        )),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),),
      ),
    );
  }
}

class AppTextField extends StatefulWidget {
 

  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;
  String list = "";
  AppTextField({

    required this.hint,
    required this.isCitySelected,
    this.cities,
    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  /// This is on text changed method which will display on city text field on changed.
 

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAddressController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
             validator: (value) =>  validInput(value!, 1, 100, "select"),
            onChanged: (value) {
              controller.city.text = widget.list;
            },
            controller: controller.city,
            cursorColor: Colors.black,
            onTap: widget.isCitySelected
                ? () {
                    FocusScope.of(context).unfocus();
                    DropDownState(
                      DropDown(
                        isDismissible: true,
                        data: widget.cities ?? [],
                        selectedItems: (List<dynamic> selectedList) {
                          for (var item in selectedList) {
                            if (item is SelectedListItem) {
                              widget.list = (item.name);
                            }
                          }
                          controller.changeCheck();
                          controller.city.text =
                              (widget.list.toString());
                        },
                        enableMultipleSelection: false,
                      ),
                    ).showModal(context);
                  }
                : null,
            decoration: InputDecoration(
              suffixIconColor: Appcolor.primaryColor,
              suffixIcon: const Icon(Icons.arrow_drop_down),
              errorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 255, 0, 0))),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 215, 0, 0))),
              floatingLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              hintText: widget.hint,
              contentPadding: const EdgeInsets.only(right: 15.0, left: 15.0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder:  const OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                            borderSide: BorderSide(color: Appcolor.primaryColor)),
                                                        focusedBorder: const OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(8.0) ),
                                                            borderSide:
                                    BorderSide(color: Colors.black)),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
