// import 'dart:js';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:mysyri/Models/appinfo.dart';

// Widget BottamBar() {
//   return Container(
//     color: Colors.transparent,
//     height: 100,
//     child: Center(
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             color: bgbottambarcolor,
//             width: MediaQuery.of(context).size.width - 80,
//             height: 60,
//             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               IconButton(
//                 splashColor: Colors.transparent,
//                 color: Colors.transparent,
//                 hoverColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 focusColor: Colors.transparent,
//                 onPressed: () {
//                   setState(() {
//                     tabNum = 0;
//                   });
//                 },
//                 icon: Icon(
//                   FontAwesomeIcons.bookOpenReader,
//                   color: tabNum == 0 ? iconcolor : inactivecolor,
//                 ),
//               ),
//               IconButton(
//                 splashColor: Colors.transparent,
//                 color: Colors.transparent,
//                 hoverColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 focusColor: Colors.transparent,
//                 onPressed: () {
//                   setState(() {
//                     tabNum = 1;
//                   });
//                 },
//                 icon: Icon(
//                   FontAwesomeIcons.solidImage,
//                   color: tabNum == 1 ? iconcolor : inactivecolor,
//                 ),
//               ),
//               IconButton(
//                 splashColor: Colors.transparent,
//                 color: Colors.transparent,
//                 hoverColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 focusColor: Colors.transparent,
//                 onPressed: () {
//                   setState(() {
//                     tabNum = 2;
//                   });
//                 },
//                 icon: Icon(
//                   FontAwesomeIcons.heartPulse,
//                   color: tabNum == 2 ? iconcolor : inactivecolor,
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     ),
//   );
// }
