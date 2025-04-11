import 'package:flutter/material.dart';
import 'package:main_quiz_app/Utilis/color_constants.dart';

class Categorycontainer extends StatelessWidget {
  final String categoryimages;
  final String categorynames;
  final void Function()? oncategorytap;
  const Categorycontainer({
    super.key,
    required this.categoryimages,
    required this.categorynames,
    required this.oncategorytap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: oncategorytap,
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF677CE6),
          border: Border.all(color: ColorConstants.maincolor),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 120,
                width: 180,
                child: Image(
                  image: AssetImage(categoryimages),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5),
              Text(categorynames,
                  style: TextStyle(
                      color: ColorConstants.headingcolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("10 Questions"),
            ],
          ),
        ),
      ),
    );
  }
}
