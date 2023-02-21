import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference firestore =
    FirebaseFirestore.instance.collection('shayri');
final CollectionReference firestoreimg =
    FirebaseFirestore.instance.collection('images');

const shareSiteUrl = '\n Download : https://shayarisspot.web.app';
