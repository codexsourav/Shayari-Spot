import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: drawercolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            leading: Icon(
              FontAwesomeIcons.homeAlt,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () async {
              await launchUrl(
                Uri.parse(privacypolicyurl),
                mode: LaunchMode.externalApplication,
              );
            },
            leading: Icon(
              FontAwesomeIcons.shield,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "Privacy Policy",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () async {
              await launchUrl(
                Uri.parse(websiteurl),
                mode: LaunchMode.externalApplication,
              );
            },
            leading: Icon(
              FontAwesomeIcons.chrome,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "Visit Website",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () async {
              await launchUrl(
                Uri.parse(instagramurl),
                mode: LaunchMode.externalApplication,
              );
            },
            leading: Icon(
              FontAwesomeIcons.instagram,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "InstaGram",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () async {
              await launchUrl(
                Uri.parse(youtubeurl),
                mode: LaunchMode.externalApplication,
              );
            },
            leading: Icon(
              FontAwesomeIcons.youtube,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "YouTube Channel",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () {
              Share.share(applinkshareinfo);
            },
            leading: Icon(
              FontAwesomeIcons.share,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "Share App",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () {
              SystemNavigator.pop();
            },
            leading: Icon(
              FontAwesomeIcons.powerOff,
              color: iconcolor,
              size: 20,
            ),
            title: Text(
              "Exit App",
              style: TextStyle(color: iconcolor, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
