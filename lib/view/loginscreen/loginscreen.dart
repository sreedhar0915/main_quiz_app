import 'package:flutter/material.dart';
import 'package:main_quiz_app/main.dart';
import 'package:main_quiz_app/view/Homescreen/Homescreen.dart';
import 'package:main_quiz_app/view/Utils/constants/color_constants/color_constants.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController usercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.black,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Title(),
            SizedBox(height: 30),
            textformfield(),
            SizedBox(height: 40),
            Inkwell(context)
          ],
        ),
      ),
    );
  }

  Row Title() {
    return Row(
      children: [
        Text("Enter Username",
            style: TextStyle(
                color: ColorConstants.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Spacer(),
      ],
    );
  }

  Form textformfield() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: usercontroller,
        decoration: InputDecoration(
          hintText: "Enter Username",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstants.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 1)),
        ),
      ),
    );
  }

  InkWell Inkwell(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {});
        if (_formKey.currentState!.validate()) {
          Username = usercontroller.text;
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
        }
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.blue,
          border: Border.all(color: ColorConstants.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text("CONTINUE",
              style: TextStyle(
                color: ColorConstants.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
