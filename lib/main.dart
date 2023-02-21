import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Pages/Tabs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.instance.initialize();
  runApp(
    const Mainapp(),
  );
}

class Mainapp extends StatelessWidget {
  const Mainapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: bgcolor,
        ),
        iconTheme: IconThemeData(color: iconcolor),
        textTheme: TextTheme(bodyMedium: TextStyle(color: whitecolor)),
      ),
      title: apptitle,
      debugShowCheckedModeBanner: false,
      home: const Tabs(),
    );
  }
}
