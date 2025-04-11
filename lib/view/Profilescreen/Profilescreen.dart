import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/main.dart';
import 'package:main_quiz_app/view/Registrationscreen/Registrationscreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({
    super.key,
  });

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  TextEditingController Namecontroller = TextEditingController();
  TextEditingController Phonenumbercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool ispasswoedvisible = false;

  String? imagepath;
  Uint8List? imagebytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.maincolor,
      appBar: Appbarsection(),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setState(() {
                        imagepath = image.path;
                      });
                    }
                  },
                  child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: ColorConstants.maincolor,
                          border: Border.all(color: ColorConstants.maincolor),
                          borderRadius: BorderRadius.circular(20)),
                      child: imagepath != null
                          ? Image.file(
                              File(imagepath!),
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "Assets/images/profiledp-removebg-preview.png",
                              fit: BoxFit.cover,
                            )),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorConstants.white,
                      border: Border.all(color: ColorConstants.black),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                              "Assets/images/background button1.png"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.headingcolor),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "$Username",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.headingcolor),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Phone Number :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.headingcolor),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "$Phonenumber",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.headingcolor),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              "Email ID :",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.headingcolor),
                            ),
                            SizedBox(width: 5),
                            Text(
                              "$email",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.headingcolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    BOTTOMSHEET(context);
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: ColorConstants.maincolor,
                        border: Border.all(color: ColorConstants.black),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        image: DecorationImage(
                            image: AssetImage(
                                "Assets/images/background button1.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      "Update",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 350,
                  width: double.infinity,
                  color: ColorConstants.maincolor,
                  child: Lottie.asset(
                      height: 100,
                      "Assets/Animations/Animation - 1744342464264.json",
                      fit: BoxFit.contain),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Registrationscreen(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorConstants.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        border: Border.all(color: ColorConstants.red),
                        image: DecorationImage(
                            image: AssetImage(
                                "Assets/images/background button1.png"),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 20,
                                color: ColorConstants.red,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.exit_to_app_outlined,
                            color: ColorConstants.red,
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> BOTTOMSHEET(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 500,
            width: double.infinity,
            decoration: BoxDecoration(
                color: ColorConstants.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(children: [
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
                                      color: ColorConstants.maincolor,
                                      width: 1)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                      bottomLeft: Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: ColorConstants.red, width: 1)),
                            ),
                            validator: (value) {
                              if (Namecontroller.text.length > 3) {
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
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Username = Namecontroller.text;
                              Phonenumber = Phonenumbercontroller.text;
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: ColorConstants.maincolor,
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
                              "update",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                  )
                ])));
      },
    );
  }

  AppBar Appbarsection() {
    return AppBar(
      backgroundColor: ColorConstants.maincolor,
      surfaceTintColor: ColorConstants.maincolor,
      // title: Center(child: Image.asset("Assets/Images/title.jpg")),
    );
  }
}
