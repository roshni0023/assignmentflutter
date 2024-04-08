import 'package:assignmentflutter/screen/home.dart';
import 'package:assignmentflutter/screen/loginpage.dart';
import 'package:assignmentflutter/screen/registration.dart';
import 'package:assignmentflutter/screen/splash_image_with_background.dart';
import 'package:assignmentflutter/screen/splash_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_with_Image(),
    );
  }
}