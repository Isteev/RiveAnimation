import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/app/pages/home/home_bindings.dart';
import 'package:gettest/app/pages/rive/rive_bindings.dart';
import 'package:gettest/app/routes/appPages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: Routes.rivePage,
      initialBinding: RiveBindings(),
    );
  }
}
