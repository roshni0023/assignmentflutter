
import 'package:flutter/material.dart';
import 'package:assignmentflutter/screen/loginpage.dart';
import 'package:assignmentflutter/utils/textThemes.dart';
import '../utils/mycolors.dart';
import 'home.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}
class _RegistrationPageState extends State<RegistrationPage> {
  String username = "admin";
  String email = "ram@gmail.com";
  String password = 'ram456';
  String confirmpassword = 'ram456';

  var usercontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var pwdcontroller = TextEditingController();
  var confirmpwdcontroller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    usercontroller.dispose();
    emailcontroller.dispose();
    pwdcontroller.dispose();
    confirmpwdcontroller.dispose();
  }

  TextEditingController passController = TextEditingController();
  var formkey = GlobalKey<FormState>();// formkey used to monitor the state of entire form and validate it
  var pwd_visibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //to avoid scrollable action
          //physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key:formkey,// if we do not set key here validation will not occur
              child: Column(
                children: [
                  const SizedBox(height: 50), // Adding space at the top
                  Text(
                      "SignUp Page",
                      style: MyTextThemes.textHeading
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      "Create Your Account",
                      style: MyTextThemes.bodyTextStyle
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(),
                      labelText: "UserName",
                      hintText: 'Enter your Username here',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator:(email){
                      if(email!.isEmpty || !email.contains('@')){
                        return "email must be a valid email";
                      }else{
                        return null;
                      }
                    } ,
                    controller: usercontroller,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      hintText: 'Enter your email here',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: pwdcontroller,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (password){
                      if(password!.isEmpty || password.length < 6) {
                        return 'Password is empty or / check the length';
                      }else{
                        return  null;
                      }
                    },
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if(pwd_visibility == true) {
                                pwd_visibility = false;
                              }else {
                                pwd_visibility = true;
                              }
                            });
                          },
                          icon: Icon(pwd_visibility == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: 'Enter your password here',
                      helperText:
                      'Password must contain upper and lowercase letters',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: pwd_visibility,
                    obscuringCharacter: '*',
                    validator: (confirmpassword){
                      if(confirmpassword!.isEmpty ||
                          confirmpassword != passController.text){
                        return "password empty/mismatch";
                      }else{
                        return null;
                      }
                    },
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if(pwd_visibility == true) {
                                pwd_visibility = false;
                              }else {
                                pwd_visibility = true;
                              }
                            });
                          },
                          icon: Icon(pwd_visibility == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
                      hintText: 'Confirm your password here',

                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    onPressed: () {
                      var valid = formkey.currentState!.validate();
                      if(valid == true){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>LoginPage()));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Registration failed")));
                      }
                    },
                    color: MyColors.basicColor,
                    minWidth: 200,
                    shape: const StadiumBorder(),
                    child: const Text("Register"),
                  ),
                  const SizedBox(height: 20), // Adjusted spacer
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Text(
                          "Already Registered?? SignIn Here!!",
                          style: MyTextThemes.bodyTextStyle))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
