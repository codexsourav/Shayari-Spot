import 'dart:io';

class AdsId {
  late String adsAppOpenId;
  late String adsBanner;
  late String adsInterstitial;
  late String rewardedads;
  late bool showads;

  AdsId() {
    showads = true;
    adsAppOpenId =
        Platform.isAndroid ? "ca-app-pub-3072759372946465/7869373855" : "";
    adsBanner =
        Platform.isAndroid ? "ca-app-pub-3072759372946465/5797474783" : "";
    adsInterstitial =
        Platform.isAndroid ? "ca-app-pub-3072759372946465/9294136162" : "";
    rewardedads =
        Platform.isAndroid ? "ca-app-pub-3072759372946465/9491779382" : "";
  }
}
