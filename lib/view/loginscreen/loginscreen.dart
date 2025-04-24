import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/view/Categoryscreen/Categoryscreen.dart';
import 'package:main_quiz_app/view/Registrationscreen/Registrationscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 320,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: ColorConstants.maincolor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    image: DecorationImage(
                        image:
                            AssetImage("Assets/images/background button1.png"),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorConstants.maincolor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    image: DecorationImage(
                        image:
                            AssetImage("Assets/images/background button1.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Column(
                    children: [
                      Textfields_section(),
                      SizedBox(height: 30),
                      Login_button(context),
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
                                        builder: (context) =>
                                            Registrationscreen(),
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
                      Privacy_section(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row Privacy_section() {
    return Row(
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
    );
  }

  InkWell Login_button(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? storedEmail = prefs.getString('email');
          String? storedPassword = prefs.getString('password');

          if (storedEmail == emailcontroller.text &&
              storedPassword == Passwordcontroller.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: ColorConstants.green,
                  content: Text("Login Successful")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Categoryscreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: ColorConstants.red,
                  content: Text("Incorrect Email or Password")),
            );
          }
        }
      },
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(
            color: ColorConstants.maincolor,
            border: Border.all(color: ColorConstants.black),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            image: DecorationImage(
                image: AssetImage("Assets/images/background button1.png"),
                fit: BoxFit.cover)),
        child: Center(
            child: Text(
          "Login",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  Form Textfields_section() {
    return Form(
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
              decoration: const InputDecoration(
                labelText: "Enter Email",
                hintText: "Emailaddress",
                fillColor: ColorConstants.Transparent,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.black, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide: BorderSide(
                        color: ColorConstants.headingcolor, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
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
              decoration: const InputDecoration(
                labelText: "Enter Password",
                hintText: "Password",
                fillColor: ColorConstants.Transparent,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.black, width: 1)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide: BorderSide(
                        color: ColorConstants.headingcolor, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                if (value.length < 5) {
                  return "Password must s at least 5 characters";
                }
                return null;
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
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: ColorConstants.red),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
