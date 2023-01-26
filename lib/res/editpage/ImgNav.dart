import 'package:flutter/material.dart';
import 'package:mysyri/Models/appinfo.dart';

Widget ImgNav({tap}) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: boxcolor,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imgshow(2, tap),
          imgshow(3, tap),
          imgshow(4, tap),
          imgshow(1, tap),
          imgshow(5, tap),
          imgshow(6, tap),
          imgshow(7, tap),
          imgshow(8, tap),
          imgshow(9, tap),
          imgshow(10, tap),
          imgshow(11, tap),
          imgshow(12, tap),
          imgshow(13, tap),
          imgshow(14, tap),
          imgshow(15, tap),
        ],
      ),
    ),
  );
}

Widget imgshow(imgnum, tap) {
  return GestureDetector(
    onTap: () {
      tap(imgnum);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 70,
          height: 70,
          child: Image.asset(
            'assets/bgimages/$imgnum.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );
}
