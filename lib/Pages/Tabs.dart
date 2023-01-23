import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Pages/Home_page.dart';
import 'package:mysyri/Pages/Image_Page.dart';
import 'package:mysyri/res/MyDrawer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:share_plus/share_plus.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int forads = 0;
  int tabNum = 0;

  @override
  void initState() {
    super.initState();
  }

  var pages = [const HomePage(), const ImagePage()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tabNum == 1) {
          setState(() {
            tabNum = 0;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: tabNum == 0 ? bgcolor : blackcolor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: whitecolor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: tabNum == 0 ? bgcolor : blackcolor,
            statusBarIconBrightness: statusbaricon,
            statusBarBrightness: statusbaricon,
          ),
          elevation: 0.0,
          backgroundColor: tabNum == 0 ? bgcolor : blackcolor,
          centerTitle: true,
          title: Text(
            apptitle,
            style: TextStyle(color: whitecolor, fontSize: 15, fontWeight: FontWeight.w300),
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
        bottomNavigationBar: SalomonBottomBar(
            currentIndex: tabNum,
            onTap: (page) {
              setState(() {
                tabNum = page;
              });
            },
            margin: const EdgeInsets.symmetric(vertical: 10),
            itemPadding: const EdgeInsets.all(12),
            unselectedItemColor: inactivecolor,
            selectedItemColor: iconcolor,
            items: [
              SalomonBottomBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 6),
                  child: Icon(
                    FontAwesomeIcons.heart,
                  ),
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 2, right: 8),
                  child: Text("Shayaris"),
                ),
              ),
              SalomonBottomBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 8, right: 6),
                  child: Icon(
                    FontAwesomeIcons.images,
                  ),
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 2, right: 8),
                  child: Text("Images"),
                ),
              ),
            ]),
        drawer: const MyDrawer(),
      ),
    );
  }
}
