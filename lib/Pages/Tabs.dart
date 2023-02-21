import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Pages/EditPage.dart';
import 'package:mysyri/Pages/Home_page.dart';
import 'package:mysyri/Pages/Image_Page.dart';
import 'package:mysyri/Pages/LatestPage.dart';
import 'package:mysyri/res/MyDrawer.dart';
import 'package:mysyri/res/MySnackBox.dart';

import 'package:share_plus/share_plus.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  final t2s = FlutterTts();
  int tabNum = 0;
  var pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      const LatestPage(),
      const HomePage(),
      const EditPage(showappbar: false),
      const ImagePage()
    ];
  }

  List titles = [
    'Shayari For You',
    'All Categories',
    'Editor',
    'Image Shayari'
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabNum != 0) {
          setState(() {
            tabNum = 0;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: tabNum == 3 ? blackcolor : bgcolor,
        appBar: tabNum != 2
            ? AppBar(
                iconTheme: IconThemeData(color: whitecolor),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: tabNum == 3 ? blackcolor : bgcolor,
                  statusBarIconBrightness: statusbaricon,
                  statusBarBrightness: statusbaricon,
                ),
                elevation: 0.0,
                backgroundColor: tabNum == 3 ? blackcolor : bgcolor,
                centerTitle: true,
                title: Text(
                  titles[tabNum].toString(),
                  style: TextStyle(
                      color: whitecolor,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Share.share(applinkshareinfo);
                      },
                      icon: const Icon(
                        Icons.share_rounded,
                        size: 18,
                      )),
                ],
              )
            : null,
        body: pages[tabNum],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: tabNum == 3 ? blackcolor : bgcolor,
          selectedItemColor: iconcolor,
          unselectedItemColor: inactivecolor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 10,
          iconSize: 20,
          currentIndex: tabNum,
          onTap: (index) {
            t2s.stop();
            setState(() {
              tabNum = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home), label: 'Lattest'),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.bookOpenReader,
              ),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.paintRoller,
              ),
              label: 'editor',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.image,
              ),
              label: 'images',
            ),
          ],
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
