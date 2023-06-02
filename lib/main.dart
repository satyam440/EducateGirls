import 'package:educategirl/Screens/bal_namakan.dart';
import 'package:educategirl/Screens/namankan_suchi.dart';
import 'package:educategirl/Screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Authentication/login_page.dart';
import 'Database/DatabaseHandler.dart';
import 'SarvekshanDataHandler/display_data_screen_sarvekshan.dart';
import 'Screens/gharelu_vibran.dart';
import 'Screens/bal_vibran.dart';
import 'Screens/dashboard.dart';
import 'Screens/home_page.dart';
import 'Authentication/login_page_new.dart';
import 'Widgets/add_gaon.dart';
import 'SarvekshanDataHandler/sarvekshan.dart';


Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 670),
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
