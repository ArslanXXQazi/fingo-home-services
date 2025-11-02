import 'package:fingodriver/scr/components/components/constant/linker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.bottomNavView,
      getPages: AppRoutes.routes,
      initialBinding: BindingsBuilder((){
        Get.put(AuthController());
        Get.put(HomeController());
      }),
    );
  }
}

