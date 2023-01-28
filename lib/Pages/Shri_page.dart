import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:mysyri/Models/ads/adsid.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/res/MybannerAd.dart';
import 'package:mysyri/res/ShyriBox.dart';

class ShriPage extends StatefulWidget {
  final String name;
  final List content;

  const ShriPage({super.key, required this.name, required this.content});

  @override
  State<ShriPage> createState() => _ShriPageState();
}

class _ShriPageState extends State<ShriPage> {
  var adload;
  final t2s = FlutterTts();
  late var playindex = null;

  @override
  void initState() {
    super.initState();
    if (AdsId().showads) {
      InterstitialAd.load(
          adUnitId: AdsId().adsInterstitial,
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              adload = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              if (kDebugMode) {
                print('InterstitialAd failed to load: $error');
              }
            },
          ));
    }
  }

  Future<bool> _willPopCallback() async {
    t2s.stop();
    if (adload != null) {
      adload.show();
      return true;
    } else {
      return true;
    }
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: bgcolor,
            leading: IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
              ),
              onPressed: () {
                if (adload != null) {
                  adload.show();
                }
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              widget.name.toString(),
              style: TextStyle(color: whitecolor, fontSize: 16, fontWeight: FontWeight.w400),
            )),
        body: ListView.builder(
          itemCount: widget.content.length,
          itemBuilder: (context, index) {
            List data = widget.content;
            data = data.reversed.toList();

            return shyriBox(context: context, name: data[index], palyshayari: palyshayari, index: index, playindex: playindex);
          },
        ),
        bottomNavigationBar: Container(color: Colors.transparent, child: getAds(adsize: AdSize.banner)),
      ),
    );
  }
}
