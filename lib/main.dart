import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Binding/InitialBinding.dart';
import 'Core/Localization/changeLocal.dart';
import 'Core/Localization/translation.dart';
import 'Core/Services/services.dart';
import 'Veiw/test.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await initialServices();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  changeLocal controllerLang = Get.put(changeLocal());
  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: MyTranslation(),
         //  home: /*(myServices.sharedPreferences.getString('choose')=="1")? const Onboard():*/lengagePage(),
          //routes: appRoutes,
          getPages: route,
        //    home: test(),
          initialBinding: InitialBinding(),
          locale: controllerLang.MyLang,
        );
      },
    );
  }
}
