import 'package:flutter/material.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Pages/Shri_page.dart';

Widget TitleBox({context, String title = "", required List data}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShriPage(
                name: title,
                content: data,
              ),
            ),
          );
        },
        child: Container(
            margin: const EdgeInsets.only(top: 15, bottom: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(color: boxcolor, borderRadius: BorderRadius.circular(10)),
            height: 64,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 120,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(color: whitecolor),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: tpiconcolor,
                  size: 18,
                )
              ],
            )),
      ),
    ],
  );
}
