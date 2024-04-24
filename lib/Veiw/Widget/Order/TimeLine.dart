// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../Controller/Color.dart';

class TimeLine extends StatelessWidget {
  final String title, subtitle;
  final bool isLast, isActive,subLast,isDelete;
  const TimeLine({super.key, required this.title, required this.subtitle, required this.isLast, required this.isActive, required this.subLast, required this.isDelete});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor:(!isActive)? Colors.grey:(isDelete)?const Color.fromARGB(255, 249, 18, 2):Appcolor.primaryColor,
              child: (isDelete&&subLast)?const Icon(Icons.cancel_outlined,color: Color.fromARGB(255, 255, 255, 255)):(subLast&&isLast)?const Icon(Icons.done,color: Colors.white,):const CircleAvatar(
                radius: 5,
                backgroundColor: Colors.white,
              ),
            ),
            
          if(isLast)const SizedBox(
              width: 2,
              height: 70,
             
            )else if (isActive&&subLast)Container(
              width: 2,
              height: 70,
             color: Colors.grey,
            )else 
              Container(
              width: 2,
              height: 70,
              color:(!isActive)? Colors.grey:(isDelete)?Colors.red:Appcolor.primaryColor,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: (isActive)?Appcolor.primaryColor:const Color.fromARGB(109, 17, 26, 120)),
              ),
           if(isActive&&(!isDelete)) Text(
                subtitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey.shade700),
              ), if(isDelete&&subLast)
              Text(
                "Order Canced",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.grey.shade700),
              ),
              SizedBox(
                height:  (!isActive)? 80:60,
              )
             
                
            ],
          ),
        )
      ],
    );
  }
}
