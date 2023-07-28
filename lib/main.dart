import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_projects/core/binding.dart';
import 'package:my_projects/core/helper/constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Assignment',
      theme: ThemeData(
          // primaryColor: themeColor,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.homeView,
      getPages: Pages.pages,
    );
  }
}
