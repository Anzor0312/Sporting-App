import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class HomeProvider extends ChangeNotifier {
 
  final Stream<QuerySnapshot> historyStream = FirebaseFirestore.instance
      .collection("history")
      .orderBy("created_at")
      .snapshots();
      final Stream<QuerySnapshot> profileStream = FirebaseFirestore.instance
      .collection("profile")
      .orderBy("created_at")
      .snapshots();
      final Stream<QuerySnapshot> statusStream = FirebaseFirestore.instance
      .collection("status")
      .orderBy("created_at")
      .snapshots();
}

