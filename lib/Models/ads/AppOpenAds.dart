import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mysyri/Models/ads/adsid.dart';

class AppOpenAdManager {
  void loadAd() {
    AppOpenAd.load(
      adUnitId: AdsId().adsAppOpenId,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          ad.show();
        },
        onAdFailedToLoad: (error) {
          if (kDebugMode) {
            print('AppOpenAd failed to load');
          }
        },
      ),
    );
  }
}
