import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';
import 'package:main_quiz_app/view/Registrationscreen/Registrationscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String username = "";
  String phonenumber = "";
  String email = "";
  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('name') ?? 'No Username Stored';
      phonenumber = prefs.getString('phone') ?? 'No phonenumber Stored';
      email = prefs.getString('email') ?? 'No email Stored';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.maincolor,
      appBar: Appbarsection(),
      body: SingleChildScrollView(
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    image: DecorationImage(
                        image:
                            AssetImage("Assets/images/background button1.png"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                            username,
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
                            phonenumber,
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
                            email,
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
              SizedBox(height: 20),
              // InkWell(
              //   onTap: () async {
              //     BOTTOMSHEET(context);
              //   },
              //   child: Container(
              //     height: 50,
              //     width: 400,
              //     decoration: BoxDecoration(
              //         color: ColorConstants.maincolor,
              //         border: Border.all(color: ColorConstants.black),
              //         borderRadius: BorderRadius.only(
              //             topRight: Radius.circular(15),
              //             topLeft: Radius.circular(15)),
              //         image: DecorationImage(
              //             image: AssetImage(
              //                 "Assets/images/background button1.png"),
              //             fit: BoxFit.cover)),
              //     child: Center(
              //         child: Text(
              //       "Update",
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     )),
              //   ),
              // ),
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
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: ColorConstants.green,
                        content: Text("Logout Successful")),
                  );
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
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
    );
  }

  AppBar Appbarsection() {
    return AppBar(
      backgroundColor: ColorConstants.maincolor,
      surfaceTintColor: ColorConstants.maincolor,
    );
  }
}
