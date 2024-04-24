import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:dialogflow_flutter/language.dart';
import 'package:dialogflow_flutter/message.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> with TickerProviderStateMixin {

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(255, 170, 48, 4),
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Center(
          child: GestureDetector(
            onTap: () {
              
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
