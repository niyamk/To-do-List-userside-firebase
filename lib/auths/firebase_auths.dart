import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth kFirebase = FirebaseAuth.instance;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

CollectionReference userCollection = firebaseFirestore.collection('users');
CollectionReference taskCollection = firebaseFirestore.collection('tasks');

String convertSpaceToUnderScore(String str) {
  return str.replaceAll(' ', '_');
}
