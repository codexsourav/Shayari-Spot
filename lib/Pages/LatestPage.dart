import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mysyri/Models/appinfo.dart';

import 'package:mysyri/res/ShyriBox.dart';

class LatestPage extends StatefulWidget {
  const LatestPage({super.key});

  @override
  State<LatestPage> createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  final t2s = FlutterTts();
  var playindex;

// lets speek
  palyshayari(name, index) async {
    if (index == playindex) {
      await t2s.pause();
      setState(() {
        playindex = null;
      });
      return false;
    }

    setState(() {
      playindex = index;
    });
    t2s.stop();
    speek(name.toString());
  }

// sppeek shayari
  speek(text) async {
    await t2s.setLanguage('hi-IN');
    await t2s.setPitch(1);
    await t2s.speak(text);
    t2s.setCompletionHandler(() {
      setState(() {
        playindex = null;
      });
    });
  }

  // stop speek
  stopspeek() async {
    t2s.stop();
    setState(() {
      playindex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('lattest').get(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data!.docs.first.data();
          List maindata = data['shayari'];
          return ListView.builder(
            itemCount: maindata.length,
            itemBuilder: (context, index) {
              return shyriBox(
                context: context,
                name: maindata[index],
                palyshayari: palyshayari,
                stop: stopspeek,
                index: index,
                playindex: playindex,
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: whitecolor,
            ),
          );
        }
      },
    );
  }
}
