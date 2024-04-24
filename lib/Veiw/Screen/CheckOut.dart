// ignore_for_file: file_names

import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:electronics_shop2/Veiw/Screen/AddAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controller/CheckOutController.dart';
import '../../Controller/Color.dart';
import '../../Controller/imgAssets.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
      body: GetBuilder<CheckOutController>(
        builder: (controller) => HandelDataRequest(
            stateRequest: controller.statusRequest,
            widget: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
              child: ListView(
                children: [
                  Row(
                    children:  [
                      Spacer(),
                      Text(
                        "Make Order",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 8, 99)),
                      ),
                      Spacer(),
                    ],
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Choose Deliver Type",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.changeType(0);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 150.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    offset: const Offset(4.0, 4.0),
                                    blurRadius: 10.0,
                                    spreadRadius: -3.0,
                                  )
                                ],
                                color: (controller.type == 0)
                                    ? Colors.grey
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: [
                                Image.asset(ImgAsset.Delivery),
                                const Text(
                                  "Delivery To Home",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.changeType(1);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 150.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(4.0, 4.0),
                                  blurRadius: 10.0,
                                  spreadRadius: -3.0,
                                )
                              ],
                              color: (controller.type == 1)
                                  ? Colors.grey
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(ImgAsset.Recive),
                                ),
                                const Text(
                                  "Receive At Shop",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                         Text(
                          "Deliver To",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            if (controller.type == 0) Get.to(const AddAddress());
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 0, 164, 5),
                          ),
                        )
                      ],
                    ),
                  ),
                  (controller.type == -1)
                      ?  SizedBox(
                          height: 135.h,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "Choose Deliver Type Frist",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 123, 123, 123),
                                  fontSize: 14.sp),
                            ),
                          ),
                        )
                      : (controller.type == 1)
                          ?  SizedBox(
                              height: 135.h,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "Not Need Address",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 123, 123, 123),
                                      fontSize: 14.sp),
                                ),
                              ),
                            )
                          : (controller.address.isEmpty)
                              ?  SizedBox(
                                  height: 135.h,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Add Address Frist",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 123, 123, 123),
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 150.h,
                                  width: double.infinity,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        controller.changeAddressI(index);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(8.0),
                                          height: 120.h,
                                          width: 250.w,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.shade400,
                                                  offset:
                                                      const Offset(4.0, 4.0),
                                                  blurRadius: 10.0,
                                                  spreadRadius: -3.0,
                                                )
                                              ],
                                              color:
                                                  (index == controller.addressI)
                                                      ? Colors.grey
                                                      : const Color.fromARGB(
                                                          255, 255, 255, 255),
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "${controller.address[index]["address_name"]}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:  TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 18.sp)),
                                              Text(
                                                "${controller.address[index]["address_details"]}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.sp,
                                                    color:
                                                        Appcolor.primaryColor),
                                              ),
                                              Text(
                                                "${controller.address[index]["address_user_name"]}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style:  TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                    fontSize: 16.sp),
                                              ),
                                              Text(
                                                  "${controller.address[index]["address_phone"]}",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:  TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.sp)),
                                              Text(
                                                  "Delivery Cost ${controller.address[index]["address_cost"]}\$",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:  TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 0, 0),
                                                      fontSize: 16.sp))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    itemCount: controller.address.length,
                                  ),
                                ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Order Summary",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  ((controller.addressI != -1 && controller.type == 0) ||
                          controller.type == 1)
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(maxHeight: double.infinity),
                                
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) {
                                if (index == controller.items.length - 1) {
                                  return Column(children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width/1.5,
                                            child: Text(
                                              "${controller.items[index]["items_name"]} x${controller.items[index]["count"]}",overflow: TextOverflow.ellipsis,
                                              style:  TextStyle( 
                                                  color: Color.fromARGB(255, 9, 4, 4),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "${(int.parse(controller.items[index]["items_price"])-(int.parse(controller.items[index]["items_discount"])/100)*int.parse(controller.items[index]["items_price"])).toInt()}\$",
                                            style:  TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                     const Divider(
                                      thickness: 2,
                                    ), 
                                    Row(
                                      children: [
                                         Text(
                                          "Subtotal",
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.sp),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${controller.total}\$",
                                          style: const TextStyle(
                                              color: Color.fromARGB(255, 15, 0, 150),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    if (controller.type == 0)
                                      Row(
                                        children: [
                                           Text("Deliver Price",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 0, 0, 0),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp)),
                                          const Spacer(),
                                          Text(
                                              "${controller.address[controller.addressI]["address_cost"]}\$",
                                              style:  TextStyle(
                                                                                               
                                              color: Color.fromARGB(255, 15, 0, 150),

                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp)),
                                        ],
                                      ),
                                 if (controller.discount!=0)  Row(
                                      children: [
                                         Text("Coupon Discount",
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp)),
                                        const Spacer(),
                                        Text(
                                            "-${(((controller.discount) / 100) * controller.total).toInt()}\$",
                                            style:  TextStyle(
                                                color: Color.fromARGB(255, 255, 27, 27),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp)),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                    Row(
                                      children: [
                                         Text("Total Price",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp)),
                                        const Spacer(),
                                        Text(
                                          (controller.type==1)? "${(controller.total - (((controller.discount) / 100) * controller.total)).toInt() }\$":       
                                            "${(controller.total+ int.parse(controller.address[controller.addressI]["address_cost"]) - (((controller.discount) / 100) * controller.total)).toInt() }\$",
                                            style:  TextStyle(
                                                color: Color.fromARGB(
                                                    255, 250, 26, 26),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.sp)),
                                      ],
                                    ),
                                  ]);
                                }
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width/1.5,
                                      child: Text(
                                        "${controller.items[index]["items_name"]} x${controller.items[index]["count"]}",
                                        style:  TextStyle(
                                            color:
                                                Color.fromARGB(255, 0, 0, 0),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${controller.items[index]["items_price"]}\$",
                                      style:  TextStyle(
                                          color:
                                              Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      : Container(
                          height: 170.h,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15.0)),
                          child:  Center(
                              child: Text(
                            "Select deliver type",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 123, 123, 123),
                                fontSize: 14.sp),
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: const Color.fromARGB(255, 0, 8, 99),
                          ),
                          child: GestureDetector(
                            onTap: () {
                             if( (controller.addressI != -1 && controller.type == 0) ||
                          controller.type == 1) {
                               controller.GoToSeccess();
                             }
                            },
                            child:  Center(
                                child: Text(
                              "Make Order",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0.sp),
                            )),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
