import 'dart:async';

import 'package:flutter/material.dart';
import 'package:assignmentflutter/screen/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_with_Image extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors:  [
                Colors.white,
                Colors.greenAccent,
                Colors.green
              ]),
          // image: DecorationImage(
          //   fit: BoxFit.cover ,
          // image: NetworkImage("https://plus.unsplash.com/premium_photo-1673306778968-5aab577a7365?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          // )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/icons/application.png")),
              Text("MyApp",

                  ///style using google fonts
                  style: GoogleFonts.combo(
                      fontSize: 70,
                      color: Colors.greenAccent
                  )
                ///style using default textstyle
                //style: TextStyle(
                //  fontSize: 70,
                //fontStyle: FontStyle.italic,
                //color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}