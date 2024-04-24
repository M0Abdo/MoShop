// ignore_for_file: file_names

import 'package:electronics_shop2/Controller/OrderController.dart';
import 'package:electronics_shop2/Core/Class/HandelData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'OrderCard.dart';

class HistoryOrder extends StatelessWidget {
  const HistoryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) => HandelDataRequest(stateRequest: controller.statusRequest, widget:(controller.historydata.isEmpty)? SizedBox(
        height: 555,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.shopping_bag_rounded,size: 150,color: Colors.grey.shade400,),
           Text("You do not have Heve Ordiers available\n at this time",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey.shade400,fontWeight: FontWeight.bold,fontSize: 16),)
        ],) ,
      ):
          ListView.builder(
                 //    physics: NeverScrollableScrollPhysics(),
             //   shrinkWrap: true,
                         
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.deleteHistory();
                          },
                          child: const SizedBox(
                            height: 15,
                            child: Text(
                              "Clear History",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                      OrderCard(index: index,),
                    ],
                  );
                }
                return OrderCard(index: index,);
              },
              itemCount: controller.historydata.length,
            ),
       
      ),
    );
  }
}
