import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/main.dart';
import 'package:main_quiz_app/view/Homescreen/Categoryscreen.dart';
import 'package:main_quiz_app/view/Registrationscreen/Registrationscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool ispasswoedvisible = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                            hintText: "Emailaddress",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.black, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.headingcolor,
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                            // if (value != Email) {
                            //   return "wrong email address";
                            // } else if (value!.isEmpty) {
                            //   return "enter email address";
                            // } else {
                            //   return null;
                            // }
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: TextFormField(
                          controller: Passwordcontroller,
                          obscureText: !ispasswoedvisible,
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            hintText: "Password",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.black, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.headingcolor,
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 5) {
                              return "Password must s at least 5 characters";
                            }
                            return null;
                            // if (value != password) {
                            //   return "Wrong password";
                            // } else if (value!.isEmpty) {
                            //   return "enter password";
                            // } else {
                            //   return null;
                            // }
                          },
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: ispasswoedvisible,
                              onChanged: (bool? value) {
                                setState(() {
                                  ispasswoedvisible = value!;
                                });
                              }),
                          Text("Show Password"),
                          Spacer(),
                          TextButton(
                              onPressed: () {
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           Forgetpasswordscreen(),
                                //     ));
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(color: ColorConstants.red),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      email = emailcontroller.text;
                      password = Passwordcontroller.text;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Categoryscreen(),
                          ));
                      // if (email=emailcontroller.text == true) {
                      //   // ScaffoldMessenger.of(context).showSnackBar(
                      //   //   SnackBar(
                      //   //     content: Text("Login successful"),
                      //   //     backgroundColor: Colors.green,
                      //   //   ),
                      //   // );
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => Categoryscreen(),
                      //       ));
                      // } else {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("Login failed"),
                      //       backgroundColor: Colors.red,
                      //     ),
                      //   );
                      // }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: ColorConstants.maincolor,
                        border: Border.all(color: ColorConstants.black),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage(
                                "Assets/images/background button1.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Row(
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Registrationscreen(),
                                ));
                          },
                          child: Text("Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.headingcolor,
                              ))),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: ColorConstants.black),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text("Conditions of use",
                          style: TextStyle(
                            color: ColorConstants.black,
                          )),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {},
                      child: Text("Privacy Notice",
                          style: TextStyle(
                            color: ColorConstants.black,
                          )),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {},
                      child: Text("Help",
                          style: TextStyle(
                            color: ColorConstants.black,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
