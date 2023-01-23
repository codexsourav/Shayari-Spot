import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mysyri/Models/ads/adsid.dart';

class getAds extends StatefulWidget {
  AdSize adsize;
  getAds({super.key, required this.adsize});

  @override
  State<getAds> createState() => _getAdsState(adsize: adsize);
}

// gujaratisuvichar@admin$54
// gujarati suvichar

class _getAdsState extends State<getAds> {
  AdSize adsize;
  _getAdsState({required this.adsize});

  var loadAd = null;

  BannerAd myBanner(adsize) {
    return BannerAd(
      adUnitId: AdsId().adsBanner,
      size: adsize,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            loadAd = ad;
          });
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            loadAd = null;
          });
          if (kDebugMode) {
            print(error);
          }
        },
        onAdClosed: (ad) {
          setState(() {
            loadAd = null;
          });
          ad.dispose();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (AdsId().showads) {
      myBanner(adsize).load();
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadAd != null
        ? Container(
            margin: const EdgeInsets.only(top: 8),
            width: adsize.width.toDouble(),
            height: adsize.height.toDouble(),
            child: AdWidget(ad: loadAd),
          )
        : const SizedBox(height: 0);
  }
}



// Widget getAds({adsize = AdSize.banner}) {


//   var ad = myBanner.load();


// }
