import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class GenderWidget extends StatelessWidget {
  final String gender;
  final IconData icon;


  GenderWidget({required this.gender, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 17, color: Colors.black54),
        ),
      ],
    );
  }
}
