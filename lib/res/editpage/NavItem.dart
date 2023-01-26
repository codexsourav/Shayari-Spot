import 'package:flutter/material.dart';
import 'package:mysyri/Models/appinfo.dart';

Widget NavItem({String title = '', IconData icon = Icons.no_encryption, tap}) {
  return MaterialButton(
    onPressed: tap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 18,
          color: iconcolor,
        ),
        const SizedBox(height: 8),
        Text(
          '$title',
          style: TextStyle(fontSize: 10, color: whitecolor),
        ),
      ],
    ),
  );
}
