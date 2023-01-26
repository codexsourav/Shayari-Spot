import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mysyri/Models/appinfo.dart';
import 'package:mysyri/Models/constents.dart';
import 'package:mysyri/res/TitleBox.dart';

class HomePage extends StatefulWidget {
  final ScrollController controller;
  HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: StreamBuilder(
        stream: firestore.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              controller: widget.controller,
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                List<QueryDocumentSnapshot<Object?>> doc = snapshot.data!.docs;
                List maindata = doc.reversed.toList();
                return TitleBox(context: context, title: maindata[index]['name'], data: maindata[index]['content']);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
        },
      ),
    );
  }
}
