import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference firestore =
    FirebaseFirestore.instance.collection('shayri');
final CollectionReference firestoreimg =
    FirebaseFirestore.instance.collection('images');
final CollectionReference firestorelattest =
    FirebaseFirestore.instance.collection('lattest');

const shareSiteUrl = '\n \n Read More : https://shayarisspot.web.app';
