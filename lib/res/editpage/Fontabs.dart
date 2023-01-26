import 'package:flutter/material.dart';
import 'package:mysyri/Models/appinfo.dart';

Widget FontsTab({tap}) {
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
          fontbox(font: 'Hugamour', tap: tap),
          fontbox(font: 'ShiftyNotesRegular', tap: tap),
          fontbox(font: 'Triyastie', tap: tap),
          fontbox(font: 'Blacklist', tap: tap),
          fontbox(font: 'Hitoribok', tap: tap),
          fontbox(font: 'Handika', tap: tap),
          fontbox(font: 'Surendra', tap: tap),
          fontbox(font: 'Homework', tap: tap),
          fontbox(font: 'Migasike', tap: tap),
          fontbox(font: 'School', tap: tap),
          fontbox(font: 'Triyastie', tap: tap),
        ],
      ),
    ),
  );
}

Widget fontbox({font, tap}) {
  return GestureDetector(
    onTap: () {
      tap(font);
    },
    child: Container(
      decoration: BoxDecoration(color: bgcolor, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Text(
        '$font',
        style: TextStyle(color: whitecolor, fontFamily: '$font'),
      ),
    ),
  );
}
