// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:electronics_shop2/Controller/Color.dart';
import 'package:electronics_shop2/Controller/OrderController.dart';
import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/OrderDetailsController.dart';
import '../Widget/Order/TimeLine.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    Get.put(OrderController());
    return Scaffold(
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) => HandelData(
            stateRequest: controller.statusRequest,
            widget: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
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
                  ),
                  const Spacer(),
                  const Text(
                    "Order Details",
                    style: TextStyle(
                        color: Appcolor.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0),
                  ),
                  const Spacer()
                ]),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Order Number: ${controller.data["order_id"]}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: Color.fromARGB(255, 55, 54, 54)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  (controller.address.isEmpty)
                      ? "Recive in Shop"
                      : "${controller.address["address_rigon"]} - ${controller.address["address_cite"]}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Color.fromARGB(255, 148, 145, 145)),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: ConstrainedBox(
                          constraints:
                              const BoxConstraints(maxHeight: double.infinity),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "Your Order",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 122, 122, 122),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 10.0),
                                child: Divider(
                                  thickness: 2,
                                  color: Color.fromARGB(255, 142, 147, 202),
                                ),
                              ),
                              GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 4.0,
                                    crossAxisSpacing: 10.0,
                                  ),
                                  itemBuilder: (context, index) => Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0),
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                      Appcolor.primaryColor,
                                                  child: Text(
                                                    "${controller.items[index]["count"]}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${controller.items[index]["items_name"]}",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 122, 122, 122),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                  Text(
                                                    "${controller.items[index]["items_brand"]}",
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 122, 122, 122),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Text(
                                                "${(int.parse(controller.items[index]["items_price"]) - (int.parse(controller.items[index]["items_discount"]) / 100) * int.parse(controller.items[index]["items_price"])).toInt()}\$",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Color.fromARGB(
                                                        255, 122, 122, 122)),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            thickness: 2,
                                            color: Color.fromARGB(
                                                255, 142, 147, 202),
                                          ),
                                        ],
                                      ),
                                  itemCount: controller.items.length),
                              Row(
                                children: [
                                  const Text(
                                    "Subtotal",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${controller.data["order_price"]}\$",
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 122, 122, 122),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              if (controller.address.isNotEmpty)
                                Row(
                                  children: [
                                    const Text(
                                      "Delivery Cost",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 122, 122, 122),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${controller.data["order_delivery"]}\$",
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 122, 122, 122),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              if (controller.data["order_coupon"] != '0')
                                Row(
                                  children: [
                                    const Text(
                                      "Discount",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 122, 122, 122),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "-${((int.parse(controller.data["order_coupon"]) / 100) * int.parse(controller.data["order_price"])).toInt()}\$",
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                              const Divider(
                                thickness: 2,
                                color: Color.fromARGB(255, 142, 147, 202),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Total Price",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 57, 57, 57),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const Spacer(),
                                  Text(
                                    (controller.address.isEmpty)
                                        ? "${int.parse(controller.data["order_price"]) - ((int.parse(controller.data["order_coupon"]) / 100) * int.parse(controller.data["order_price"])).toInt()}\$"
                                        : "${int.parse(controller.data["order_price"]) + int.parse(controller.data["order_delivery"]) - ((int.parse(controller.data["order_coupon"]) / 100) * int.parse(controller.data["order_price"])).toInt()}\$",
                                    style: const TextStyle(
                                        color: Appcolor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: Text(
                                  "Delivery To",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 57, 57, 57),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ),
                              const Divider(
                                thickness: 2,
                                color: Color.fromARGB(255, 142, 147, 202),
                              ),
                              Text(
                                (controller.address.isEmpty)
                                    ? "Recive in Shop"
                                    : "${controller.address["address_details"]}",
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 122, 122, 122),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              if (controller.address.isNotEmpty &&
                                  controller.data["order_state"] != '3')
                                Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Text(
                                        "Track Order",
                                        style: TextStyle(
                                            color: Appcolor.primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      color: Color.fromARGB(255, 142, 147, 202),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: SizedBox(
                                          height: 250,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 3,
                                            itemBuilder: (context, index) => TimeLine(
                                                isDelete: false,
                                                isActive: (index <
                                                        int.parse(controller
                                                                    .data[
                                                                "order_state"]) +
                                                            1)
                                                    ? true
                                                    : false,
                                                subLast: (index ==
                                                        int.parse(controller
                                                                .data[
                                                            "order_state"]))
                                                    ? true
                                                    : false,
                                                isLast:
                                                    (index == 2) ? true : false,
                                                title:
                                                    controller.track1[index],
                                                subtitle:
                                                    controller.track2[index]),
                                          )),
                                    ),
                                  ],
                                ),
                              if (controller.data["order_state"] == '3')
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.cancel_outlined,
                                          color:
                                              Color.fromARGB(255, 255, 17, 0),
                                          size: 100,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Order Canced",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 255, 17, 0)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (controller.data["order_state"] == '0' &&
                                  controller.address.isEmpty)
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.rocket_launch_outlined,
                                          color:
                                              Color.fromARGB(255, 255, 17, 0),
                                          size: 100,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          " Go To Shop To Receive",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 255, 17, 0)),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (controller.data["order_state"] == '2' &&
                                  controller.data["order_address"] == null)
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.task_alt_outlined,
                                          color: Color.fromARGB(255, 0, 213, 7),
                                          size: 100,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Order Recived",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 0, 213, 7)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              if (controller.data["order_state"] == '0')
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GetBuilder<OrderController>(
                                      builder: (controller1) => GestureDetector(
                                        onTap: () {
                                          controller1.delete(controller.i);
                                          Get.back();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 17, 0),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Center(
                                                child: Text(
                                              "Delete",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            )),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ))),
                ),
              ]),
            )),
      ),
    );
  }
}
