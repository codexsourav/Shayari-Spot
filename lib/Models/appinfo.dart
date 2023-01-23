import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

var brightness = SchedulerBinding.instance.window.platformBrightness;

const String apptitle = "Shayari Spot";

Brightness statusbaricon = Brightness.light;
String dvtheme = brightness.name;
// colors app
Color bgcolor = dvtheme != 'dark' ? const Color.fromARGB(255, 75, 44, 133) : const Color.fromARGB(255, 22, 21, 21);
Color boxcolor = dvtheme != 'dark' ? const Color.fromARGB(68, 120, 62, 187) : const Color.fromARGB(255, 51, 51, 51);
Color iconcolor = dvtheme != 'dark' ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255);
Color whitecolor = dvtheme != 'dark' ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255);
Color boxiconcolor = dvtheme != 'dark' ? const Color.fromARGB(129, 255, 255, 255) : const Color.fromARGB(146, 255, 255, 255);
Color inactivecolor = dvtheme != 'dark' ? const Color.fromARGB(80, 255, 255, 255) : const Color.fromARGB(88, 255, 255, 255);
Color drawercolor = dvtheme != 'dark' ? const Color.fromARGB(255, 54, 5, 104) : const Color.fromARGB(255, 22, 22, 22);
Color blackcolor = dvtheme != 'dark' ? const Color.fromARGB(255, 0, 0, 0) : const Color.fromARGB(255, 5, 5, 5);
Color alertblackcolor = dvtheme != 'dark' ? const Color.fromARGB(255, 22, 22, 22) : const Color.fromARGB(255, 54, 54, 54);
Color alertcolor = dvtheme != 'dark' ? const Color.fromARGB(255, 105, 66, 179) : const Color.fromARGB(255, 43, 43, 43);
Color tpiconcolor = dvtheme != 'dark' ? const Color.fromARGB(117, 255, 255, 255) : const Color.fromARGB(137, 255, 255, 255);

// socail media info
const String websiteurl = 'https://codexsourav.vercel.app/';
const String privacypolicyurl = 'https://shayarisspot.web.app/privacypolicy.html';
const String instagramurl = 'https://www.instagram.com/codexsourav';
const String telegramurl = 'https://www.instagram.com/codexsourav';
const String youtubeurl = 'https://www.youtube.com/@codexsourav';
const String facebookurl = 'https://fb.com/fbinsourav';

// app download link
const String applinkshareinfo = 'Hi , I AM Useing A Cool Shayari App Of Intresting Shayari.  If You Interest Download Now - https://shayarisspot.web.app';
