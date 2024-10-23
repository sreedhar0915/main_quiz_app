import 'package:flutter/material.dart';
import 'package:main_quiz_app/view/Utils/constants/color_constants/color_constants.dart';

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
        height: 110,
        width: 200,
        decoration: BoxDecoration(
          color: ColorConstants.grey,
          border: Border.all(color: ColorConstants.blue),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 180,
                child: Image(
                  image: AssetImage(categoryimages),
                  fit: BoxFit.cover,
                ),
              ),
              Spacer(),
              Text(categorynames,
                  style: TextStyle(
                      color: ColorConstants.black,
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
