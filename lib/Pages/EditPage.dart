import 'dart:io';
import 'dart:ui';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mysyri/Models/ads/adsid.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/res/MySnackBox.dart';
import 'package:mysyri/res/editpage/Fontabs.dart';
import 'package:mysyri/res/editpage/ImgNav.dart';
import 'package:mysyri/res/editpage/NavItem.dart';
import 'package:mysyri/res/editpage/Watermark.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class EditPage extends StatefulWidget {
  final shayari;

  const EditPage({super.key, required this.shayari});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late String shayari;
  late TextEditingController textcontroller;
  WidgetsToImageController imgcontroller = WidgetsToImageController();
  var adload;
  late RewardedInterstitialAd rewordedad;
  bool pro = false;

// loadadfunction
  loaads() {
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

// set reworded ads
  rewordadsload() async {
    await RewardedInterstitialAd.load(
      adUnitId: AdsId().rewardedads,
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          rewordedad = ad;
        },
        onAdFailedToLoad: (e) {
          if (kDebugMode) {
            print('////////// Ads Load Field');
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    shayari = widget.shayari;
    textcontroller = TextEditingController(text: widget.shayari);

// fo ads
    loaads();
    rewordadsload();
  }

  int clicktab = 0;
  int imgnum = 2;
  double textsize = 20;
  double bgblur = 5;
  Color textcolor = Colors.white;
  Color sbgcolor = Colors.transparent;
  String fontname = 'Hugamour';
  bool loading = false;

// on set bg iamge
  onbgimgtap(gimgnum) {
    setState(() {
      imgnum = gimgnum;
    });

    if (sbgcolor != Colors.transparent) {
      setState(() {
        sbgcolor = Colors.transparent;
      });
    }
  }

// onset font text
  onfonttap(gfontname) {
    setState(() {
      fontname = gfontname;
    });
  }

// oncaptha final iamge
  Future getimgFinal() async {
    return await imgcontroller.capture();
  }

// for share image
  shareimge() async {
    setState(() {
      loading = true;
    });
    var byts = await getimgFinal();
    final t = await getTemporaryDirectory();
    final path = "${t.path}/shayarispot.png";
    await File(path).writeAsBytes(byts);
    setState(() {
      loading = false;
    });
    Share.shareXFiles([XFile(path)]);
  }
// for save final image

  saveimage() async {
    setState(() {
      loading = true;
    });
    var time = DateTime.now().millisecondsSinceEpoch;
    var byts = await getimgFinal();
    final directory = Directory('/storage/emulated/0/Download');
    File file2 = File("${directory.path}/Shayari_Spot_$time.jpg");
    await file2.writeAsBytes(byts);
    setState(() {
      loading = false;
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      mysnackbar(
        msg: "Downloading Complete",
        color: alertblackcolor,
        onpress: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        icon: Icon(
          Icons.download_done_rounded,
          color: iconcolor,
        ),
      ),
    );

    if (adload != null) {
      adload.show();
      loaads();
    }
  }

  proPopup() async {
    ScaffoldMessenger.of(context).showSnackBar(
      mysnackbar(
        msg: "   Show A Video To Remove Watermark",
        color: const Color.fromARGB(255, 105, 98, 0),
        onpress: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (rewordedad != null) {
            rewordedad.show(
                onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
              setState(() {
                pro = true;
              });
            });
          } else {
            rewordadsload();
          }
        },
        icon: Icon(
          FontAwesomeIcons.crown,
          color: iconcolor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var swidth = MediaQuery.of(context).size.width - 50;
    var shight = MediaQuery.of(context).size.height - 350;
    List Tab = [
      BottamBar(),
      Lengthbar(),
      FontsTab(tap: onfonttap),
      ImgNav(tap: onbgimgtap),
      Lengthbar(),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (clicktab != 0) {
          setState(() {
            clicktab = 0;
          });
          return false;
        } else {
          if (adload != null) {
            adload.show();
            return true;
          } else {
            return true;
          }
        }
      },
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgcolor,
          leading: IconButton(
            onPressed: () {
              if (adload != null) {
                adload.show();
              }
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 18,
            ),
          ),
          actions: [
            IconButton(
              disabledColor: Colors.yellow,
              onPressed: !pro ? proPopup : null,
              icon: const Icon(
                FontAwesomeIcons.crown,
                size: 18,
              ),
            ),
            IconButton(
              disabledColor: inactivecolor,
              onPressed: !loading ? saveimage : null,
              icon: const Icon(
                Icons.save,
                size: 18,
              ),
            ),
            IconButton(
              onPressed: !loading ? shareimge : null,
              disabledColor: inactivecolor,
              icon: const Icon(
                Icons.share,
                size: 18,
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Center(
              child: WidgetsToImage(
                controller: imgcontroller,
                child: ClipRRect(
                  child: Container(
                    height: shight,
                    width: swidth,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          alignment: Alignment.center,
                          matchTextDirection: true,
                          repeat: ImageRepeat.noRepeat,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/bgimages/$imgnum.jpg"),
                        )),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: bgblur,
                            sigmaY: bgblur,
                          ),
                          child: Container(
                            color: sbgcolor,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onDoubleTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Edittext();
                                  },
                                );
                              },
                              child: Text(
                                shayari,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: textsize,
                                  color: textcolor,
                                  fontFamily: '$fontname',
                                ),
                              ),
                            ),
                          ),
                        ),
                        !pro ? watermark() : const SizedBox(width: 0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          decoration: BoxDecoration(
            color: boxcolor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Tab[clicktab],
        ),
      ),
    );
  }

  Widget Lengthbar() {
    return Slider(
      thumbColor: whitecolor,
      activeColor: bgbottambarcolor,
      inactiveColor: bgcolor,
      value: clicktab == 1 ? textsize : bgblur,
      max: 50,
      min: 0,
      onChanged: (v) {
        if (clicktab == 1) {
          setState(() {
            textsize = v;
          });
        } else if (clicktab == 4) {
          setState(() {
            bgblur = v;
          });
        }
      },
    );
  }

  Widget BottamBar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: boxcolor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavItem(
              icon: FontAwesomeIcons.pen,
              title: 'Edit text',
              tap: () {
                setState(() {
                  clicktab = 0;
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Edittext();
                  },
                );
              },
            ),
            NavItem(
              icon: Icons.format_size_sharp,
              title: 'Text Size',
              tap: () {
                setState(() {
                  clicktab = 1;
                });
              },
            ),
            NavItem(
              icon: FontAwesomeIcons.font,
              title: 'Text Font',
              tap: () {
                setState(() {
                  clicktab = 2;
                });
              },
            ),
            NavItem(
              icon: Icons.color_lens,
              title: 'Text Color',
              tap: () {
                setState(() {
                  clicktab = 0;
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertColor(type: 'text');
                  },
                );
              },
            ),
            NavItem(
              icon: FontAwesomeIcons.image,
              title: 'Image',
              tap: () {
                setState(() {
                  clicktab = 3;
                });
              },
            ),
            NavItem(
              icon: FontAwesomeIcons.imagePortrait,
              title: 'Image Blur',
              tap: () {
                setState(() {
                  clicktab = 4;
                });
              },
            ),
            NavItem(
              icon: Icons.colorize_rounded,
              title: 'BG Color',
              tap: () {
                setState(() {
                  clicktab = 0;
                });
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alertColor(type: 'bg');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget alertColor({type}) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: SizedBox(
        height: 400,
        child: ColorPicker(
          pickersEnabled: {
            ColorPickerType.both: false,
            ColorPickerType.wheel: true,
            ColorPickerType.accent: false,
          },

          padding: const EdgeInsets.all(0),
          // Use the screenPickerColor as start color.
          color: Colors.red,
          // Update the screenPickerColor using the callback.
          onColorChanged: (Color color) {
            if (type == 'text') {
              setState(() {
                textcolor = color;
              });
            } else {
              setState(() {
                sbgcolor = color;
              });
            }
          },
          width: 44,
          borderColor: Colors.transparent,
          height: 44,
          borderRadius: 22,
          wheelSquareBorderRadius: 100,

          subheading: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              'Select color shade',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }

  Widget Edittext() {
    return AlertDialog(
      backgroundColor: bgcolor,
      insetPadding: const EdgeInsets.all(10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Container(
        height: 190,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: textcontroller,
              maxLines: 5,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white, fontSize: 21),
              decoration: const InputDecoration.collapsed(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    shayari = textcontroller.text;
                  });
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save Shayari',
                  style: TextStyle(color: whitecolor),
                ))
          ],
        ),
      ),
    );
  }
}
