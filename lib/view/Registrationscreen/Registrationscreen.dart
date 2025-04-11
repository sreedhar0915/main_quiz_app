import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/main.dart';
import 'package:main_quiz_app/view/loginscreen/loginscreen.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  bool ispasswoedvisible = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController Phonenumbercontroller = TextEditingController();
  TextEditingController passwordconfirmcontroller = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 400,
                  child: Image(
                      image: AssetImage(
                          "Assets/images/registration-removebg-preview.png")),
                ),
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
                          controller: Namecontroller,
                          decoration: InputDecoration(
                            labelText: "Enter Name",
                            hintText: "Name",
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
                                    color: ColorConstants.maincolor, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (Namecontroller.text.length <= 2) {
                              return "enter valid name";
                            } else if (value!.isEmpty) {
                              return "enter password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: TextFormField(
                          controller: Phonenumbercontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Enter Phonenumber",
                            hintText: "Phonenumber",
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
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (Phonenumbercontroller.text.length < 10) {
                              return "enter valid phone number";
                            } else if (value!.isEmpty) {
                              return "enter password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
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
                                    color: ColorConstants.maincolor, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (value == null ||
                                !emailcontroller.text.contains("@gmail.com")) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10),
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
                                    color: ColorConstants.maincolor, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (Passwordcontroller.text.length < 5) {
                              return "password must contain atleast 5 characters";
                            } else if (value!.isEmpty) {
                              return "enter password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: TextFormField(
                          controller: passwordconfirmcontroller,
                          obscureText: !ispasswoedvisible,
                          decoration: InputDecoration(
                            labelText: "Enter confirm Password",
                            hintText: "confirm Password",
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
                                    color: ColorConstants.maincolor, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15)),
                                borderSide: BorderSide(
                                    color: ColorConstants.red, width: 1)),
                          ),
                          validator: (value) {
                            if (passwordconfirmcontroller.text.isEmpty) {
                              return "confirm password";
                            } else if (passwordconfirmcontroller.text !=
                                Passwordcontroller.text) {
                              return "password do not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
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
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Username = Namecontroller.text;
                      email = emailcontroller.text;
                      Phonenumber = Phonenumbercontroller.text;
                      password = Passwordcontroller.text;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Registration Successfull",
                        ),
                        backgroundColor: ColorConstants.green,
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Registration failed",
                        ),
                        backgroundColor: ColorConstants.red,
                      ));
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage(
                                "Assets/images/background button1.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 30),
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
