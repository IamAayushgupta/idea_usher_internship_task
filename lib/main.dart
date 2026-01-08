import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.routes[0].name,
      getPages: AppPages.routes,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
    ),
  );
}
