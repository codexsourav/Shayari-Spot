import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Pages/Home_page.dart';
import 'package:mysyri/Pages/Image_Page.dart';
import 'package:mysyri/res/MyDrawer.dart';

import 'package:share_plus/share_plus.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int tabNum = 0;
  bool _showBottam = false;
  ScrollController controller = ScrollController();
  var pages;

  @override
  void initState() {
    super.initState();
    pages = [HomePage(controller: controller), const ImagePage()];
    controller.addListener(() {
      bool res =
          controller.position.userScrollDirection != ScrollDirection.forward;
      if (res != _showBottam) {
        setState(() {
          _showBottam = res;
        });
      }
    });
  }

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
        extendBody: true,
        backgroundColor: tabNum == 1 ? blackcolor : bgcolor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: whitecolor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: tabNum == 1 ? blackcolor : bgcolor,
            statusBarIconBrightness: statusbaricon,
            statusBarBrightness: statusbaricon,
          ),
          elevation: 0.0,
          backgroundColor: tabNum == 1 ? blackcolor : bgcolor,
          centerTitle: true,
          title: Text(
            apptitle,
            style: TextStyle(
                color: whitecolor, fontSize: 15, fontWeight: FontWeight.w300),
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
        ),
        body: pages[tabNum],
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.transparent,
          height: !_showBottam ? 100 : 0,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: tabNum == 0
                      ? bgbottambarcolor
                      : const Color.fromARGB(94, 0, 0, 0),
                  width: MediaQuery.of(context).size.width - 180,
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          splashColor: Colors.transparent,
                          color: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              tabNum = 0;
                            });
                          },
                          icon: Icon(
                            FontAwesomeIcons.bookOpenReader,
                            color: tabNum == 0 ? iconcolor : inactivecolor,
                          ),
                        ),
                        IconButton(
                          splashColor: Colors.transparent,
                          color: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              tabNum = 1;
                            });
                          },
                          icon: Icon(
                            FontAwesomeIcons.solidImage,
                            color: tabNum == 1 ? iconcolor : inactivecolor,
                          ),
                        ),
                        // IconButton(
                        //   splashColor: Colors.transparent,
                        //   color: Colors.transparent,
                        //   hoverColor: Colors.transparent,
                        //   highlightColor: Colors.transparent,
                        //   focusColor: Colors.transparent,
                        //   onPressed: () {
                        //     setState(() {
                        //       tabNum = 2;
                        //     });
                        //   },
                        //   icon: Icon(
                        //     FontAwesomeIcons.heartPulse,
                        //     color: tabNum == 2 ? iconcolor : inactivecolor,
                        //   ),
                        // ),
                      ]),
                ),
              ),
            ),
          ),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
