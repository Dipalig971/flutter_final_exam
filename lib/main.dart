import 'package:flutter/material.dart';
import 'package:flutter_final_exam/view/home/home_screen.dart';
import 'package:flutter_final_exam/view/splash/splash_screen.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen() ,
    );
  }
}
