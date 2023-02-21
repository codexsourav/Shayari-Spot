import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysyri/res/ImgBox.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
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
