import 'dart:async';

import 'package:assignmentflutter/screen/gridview/gridview1.dart';
import 'package:assignmentflutter/screen/listView/listview_separated.dart';
import 'package:assignmentflutter/screen/registration.dart';
import 'package:flutter/material.dart';
import 'package:assignmentflutter/screen/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_with_Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GridView1()));
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/background.png"))),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The best app for yours plants",
                style: GoogleFonts.cambo(
                  fontSize: 50,
                  color: Colors.white,
                )),
                MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  minWidth: 290,
                  child: Text("Sign up"),
                  shape: StadiumBorder(),
                ),
            MaterialButton(
              onPressed: (){},
              color: Colors.green,
              minWidth: 290,
              child: Text("Login"),
              shape: StadiumBorder(),
            ),
            RichText(text: TextSpan()),
          ],
      ),
    ),
      ),
    );
  }
}
