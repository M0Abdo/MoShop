import 'package:electronics_shop2/Veiw/Screen/Address.dart';
import 'package:electronics_shop2/Veiw/Screen/Search.dart';
import 'package:electronics_shop2/Veiw/Screen/VerifcationSignUp.dart';
import 'package:electronics_shop2/Veiw/Screen/ForgtPass/ResetPass.dart';
import 'package:electronics_shop2/Veiw/Screen/lengagePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/AppRoute.dart';
import 'Core/MiddelWare/MyMiddelWare.dart';
import 'Veiw/Screen/ForgtPass/CheckEmail.dart';
import 'Veiw/Screen/ForgtPass/ForgetPass.dart';
import 'Veiw/Screen/HomeScreen.dart';
import 'Veiw/Screen/Onboard.dart';
import 'Veiw/Screen/SignUp.dart';
import 'Veiw/Screen/Success.dart';
import 'Veiw/Screen/item.dart';
import 'Veiw/Screen/itemDescription.dart';
import 'Veiw/Screen/login.dart';

List<GetPage<dynamic>>? route = [
  
  GetPage(name: "/", page: ()=> lengagePage(),middlewares: [
    MyMiddelWare()
  ]),
  GetPage(name:   AppRoute.signUp, page: ()=>  const SignUp(),transition: Transition.leftToRight),
  GetPage(name:   AppRoute.login, page: ()=>   const login(),transition: Transition.fade),
  GetPage(name: AppRoute.onBoarding, page: ()=> const Onboard(),transition: Transition.leftToRight),
  GetPage(name: AppRoute.ForgetPassR, page: ()=> const ForgetPass(),transition: Transition.leftToRight),
  GetPage(name: AppRoute.VerifcationSignUp, page: ()=> const VerifcationSignUp(),transition: Transition.leftToRight),
  GetPage(name: AppRoute.ResetPass, page: ()=> const RestPass(),transition: Transition.leftToRight),
  GetPage(name: AppRoute.CheckEmail, page: ()=>  const CheckEmail(),transition: Transition.leftToRight),
  GetPage(name:  AppRoute.Success, page: ()=>  const Success(),transition: Transition.leftToRight),
  GetPage(name:  AppRoute.Home, page: ()=>   const HomeScreen(),transition: Transition.leftToRight),
  GetPage(name:  AppRoute.Item, page: ()=>    const Item(),transition: Transition.fade),
  GetPage(name:  AppRoute.ItemDis, page: ()=>   const ItemDescription(),transition: Transition.leftToRight,),  

];

