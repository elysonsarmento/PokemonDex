import 'package:flutter/material.dart';
import 'package:flutterdex/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Fetx Dex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: '/',
      getPages: AppPages.routes,
      // home: HomeView(),
    );
  }
}
