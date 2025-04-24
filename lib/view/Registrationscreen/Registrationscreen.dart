import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/view/loginscreen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                    "REGISTRATION",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 585,
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
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Textfields_section(),
                      SizedBox(height: 30),
                      Registration_button(context),
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
            ],
          ),
        ),
      ),
    );
  }

  InkWell Registration_button(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('name', Namecontroller.text);
          await prefs.setString('phone', Phonenumbercontroller.text);
          await prefs.setString('email', emailcontroller.text);
          await prefs.setString('password', Passwordcontroller.text);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: ColorConstants.green,
                content: Text("Registered Successfully")),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Loginscreen()),
          );
        }
      },
      child: Container(
        height: 50,
        width: 400,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
            image: DecorationImage(
                image: AssetImage("Assets/images/background button1.png"),
                fit: BoxFit.cover)),
        child: Center(
            child: Text(
          "Register",
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
              controller: Namecontroller,
              decoration: const InputDecoration(
                labelText: "Enter Name",
                hintText: "Name",
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
                    borderSide:
                        BorderSide(color: ColorConstants.maincolor, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
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
              decoration: const InputDecoration(
                labelText: "Enter Phonenumber",
                hintText: "Phonenumber",
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
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
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
                    borderSide:
                        BorderSide(color: ColorConstants.maincolor, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
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
                    borderSide:
                        BorderSide(color: ColorConstants.maincolor, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
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
              decoration: const InputDecoration(
                labelText: "Enter confirm Password",
                hintText: "confirm Password",
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
                    borderSide:
                        BorderSide(color: ColorConstants.maincolor, width: 1)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    borderSide:
                        BorderSide(color: ColorConstants.red, width: 1)),
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
        ],
      ),
    );
  }
}
