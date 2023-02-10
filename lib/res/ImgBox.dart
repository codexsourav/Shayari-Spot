import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/res/MySnackBox.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImgBox extends StatefulWidget {
  final url;

  const ImgBox({
    super.key,
    required this.url,
  });

  @override
  State<ImgBox> createState() => _ImgBoxState(url: url);
}

class _ImgBoxState extends State<ImgBox> {
  final url;

  _ImgBoxState({required this.url});

  downlaodFile() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        mysnackbar(
          msg: "Start Downloading...",
          color: alertblackcolor,
          icon: Icon(
            Icons.download,
            color: iconcolor,
          ),
        ),
      );
      var imageId = await ImageDownloader.downloadImage(url,
          destination: AndroidDestinationType.directoryPictures);

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        mysnackbar(
          msg: "Downloading Complete",
          color: alertblackcolor,
          icon: Icon(
            Icons.download_done_rounded,
            color: iconcolor,
          ),
        ),
      );

      if (imageId == null) {
        return;
      }
    } catch (e) {
      if (kDebugMode) {
        print("error");
      }
    }
  }

  shareImage() async {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final urld = Uri.parse(url.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      mysnackbar(
        msg: "  Loading Image...",
        color: const Color.fromARGB(255, 37, 37, 37),
        icon: const Icon(
          Icons.downloading_rounded,
          color: Colors.white,
        ),
      ),
    );
    final response = await http.get(urld);
    final t = await getTemporaryDirectory();
    final path = "${t.path}/shayarispot.png";
    await File(path).writeAsBytes(response.bodyBytes);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    Share.shareXFiles([XFile(path)]);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width.toDouble(),
              height: (MediaQuery.of(context).size.height - 20).toDouble(),
              child: CachedNetworkImage(
                imageUrl: url,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                )),
                errorWidget: (context, url, error) => const Center(
                    child: Icon(
                  Icons.error,
                  color: Color.fromARGB(255, 255, 99, 87),
                )),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120, right: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    btnAction(
                        iconname: Icons.content_copy_rounded,
                        title: "Copy Link",
                        onpress: () async {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          FlutterClipboard.copy('hello flutter friends')
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              mysnackbar(
                                msg: " Copy To Clipbord",
                                color: const Color.fromARGB(255, 37, 37, 37),
                                icon: const Icon(
                                  Icons.copy,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          });
                        }),
                    const SizedBox(height: 20),
                    btnAction(
                        iconname: FontAwesomeIcons.whatsapp,
                        title: "Share",
                        onpress: shareImage),
                    const SizedBox(height: 20),
                    btnAction(
                      iconname: Icons.download,
                      title: "Download",
                      onpress: downlaodFile,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

// download Btn an more

  Widget btnAction({iconname, title, onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: 80,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconname,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(height: 8),
            Text(
              "$title",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
