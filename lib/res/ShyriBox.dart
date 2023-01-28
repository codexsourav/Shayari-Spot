import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Models/constents.dart';
import 'package:mysyri/Pages/EditPage.dart';
import 'package:mysyri/res/MySnackBox.dart';
import 'package:share_plus/share_plus.dart';

Widget shyriBox({required context, required String name, required palyshayari, index, playindex}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(color: boxcolor, borderRadius: BorderRadius.circular(20)),
        width: double.infinity,
        child: Column(children: [
          Center(
            child: Text(
              textAlign: TextAlign.center,
              name.toString(),
              style: TextStyle(
                color: whitecolor,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  FlutterClipboard.copy('$name \n \n ${shareSiteUrl.toString()}').then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      mysnackbar(
                        color: alertcolor,
                        msg: "Copy To Clipbord",
                        onpress: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    );
                  });
                },
                icon: Icon(
                  Icons.copy,
                  size: 20,
                  color: tpiconcolor,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditPage(shayari: name.toString()),
                  ));
                },
                icon: Icon(FontAwesomeIcons.pen, size: 15, color: tpiconcolor),
              ),
              IconButton(
                onPressed: () {
                  palyshayari(name.toString(), index);
                },
                icon: playindex != index ? Icon(Icons.play_arrow_rounded, size: 30, color: tpiconcolor) : Icon(Icons.pause_rounded, size: 30, color: tpiconcolor),
              ),
              IconButton(
                onPressed: () {
                  Share.share('$name \n \n ${shareSiteUrl.toString()}');
                },
                icon: Icon(Icons.share, size: 20, color: tpiconcolor),
              )
            ],
          )
        ]),
      ),
    ],
  );
}
