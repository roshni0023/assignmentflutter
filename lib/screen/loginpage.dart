import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:assignmentflutter/screen/registration.dart';
import 'package:assignmentflutter/utils/mycolors.dart';
import 'package:assignmentflutter/utils/textThemes.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/const_snackbar.dart';
import 'listView/home.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  String username = 'Priya Roy';
  String password = 'priya123';

  var usercontroller = TextEditingController();
  var pwdcontroller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    usercontroller.dispose();
    pwdcontroller.dispose();
  }

  TextEditingController passController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
           physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key:formkey,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/image/background.png"),
                  ),
                  Text(
                      "welcome back",
                      style:MyTextThemes.textHeading
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                 // Align(
                   // alignment: Alignment.topRight,
                    //child: Image.asset("assets/image/leaf.png"),
                  //),
                  Text(
                      "Login to your account",
                      style: MyTextThemes.bodyTextStyle
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@')) {
                        return "email must be a vaild email";
                      } else {
                        return null;
                      }
                    },
                    controller: usercontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                      hintText: 'Enter your full name here',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (password){
                      if(password!.isEmpty || password.length < 6){
                        return 'password is empty or / check the length';
                      }else{
                        return null;
                      }
                    },
                    controller: pwdcontroller,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: 'Enter your password here',
                      helperText: 'Forget Password',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      if (username == usercontroller.text &&
                          password == pwdcontroller.text){
                        successSnackbar(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomePage()));
                      }else{
                        errorSnackbar(context);
                      }
                      usercontroller.clear();
                      pwdcontroller.clear();
                    },
                    color: MyColors.basicColor,
                    minWidth: 200,
                    shape: const StadiumBorder(),
                    child: const Text("Login"),
                  ),
                  const SizedBox(height: 20), // Adjusted spacer
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?",
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegistrationPage()));
                            },
                          text: " SignUp",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}