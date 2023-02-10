import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mysyri/Models/ads/adsid.dart';
import 'package:mysyri/res/ImgBox.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  var adload;
  int showadpage = 5;
  int pageindex = 0;

  loadadinst() {
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

  @override
  void initState() {
    super.initState();
    loadadinst();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          FirebaseFirestore.instance.collection('images').doc("walpaper").get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.data() == null) {
            return const SizedBox();
          }

          List data = snapshot.data!.data()!['imgList'];
          data = data.reversed.toList();
          return PageView.builder(
            itemCount: data.length,
            scrollDirection: Axis.vertical,
            key: UniqueKey(),
            onPageChanged: ((value) {
              pageindex = value;
              if (value == showadpage) {
                if (adload != null) {
                  adload.show();
                  adload == null;
                  showadpage = showadpage + 20;
                  loadadinst();
                }
              }
            }),
            itemBuilder: (context, index) {
              return ImgBox(url: data[index].toString());
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      },
    );
  }
}
