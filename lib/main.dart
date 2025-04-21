import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:umer_khalid/modules/home/controllers/home_controller.dart';
import 'package:umer_khalid/routes/app_routes.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  Get.lazyPut(() => HomeController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    log("pausing.....");
    await Future.delayed(Duration(seconds: 3));
    log("unpausing");
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Ecommerce Test',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: AppRoutes.home,
          getPages: AppRoutes.pages,
        );
      },
    );
  }
}
