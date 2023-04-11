import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FirebaseContorller {
  Future<Map<String, dynamic>> getDoc(
      {required String collectionPath, required String document}) async {
    print("Fetching data from $collectionPath");
    if (FirebaseAuth.instance.currentUser == null) {
      return {};
    }
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(collectionPath)
        .doc(document)
        .get();
    return snapshot.data()!;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getallDocuments(
      {required String collectionPath,
      String isEqualTo = "",
      String feild = ""}) async {
    print("Fetching data from $collectionPath");
    if (FirebaseAuth.instance.currentUser == null) {
      return [];
    }
    QuerySnapshot<Map<String, dynamic>> snapshot = feild.isEmpty
        ? await FirebaseFirestore.instance.collection(collectionPath).get()
        : await FirebaseFirestore.instance
            .collection(collectionPath)
            .where("field", isEqualTo: feild)
            .get();
    return snapshot.docs;
  }

  Future<bool> setDoc(
      {required String collectionPath,
      required String document,
      required Map<String, dynamic> data}) async {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    print(collectionPath);
    try {
      document.isEmpty
          ? await FirebaseFirestore.instance
              .collection(collectionPath)
              .doc()
              .set(data, SetOptions(merge: true))
          : await FirebaseFirestore.instance
              .collection(collectionPath)
              .doc(document)
              .set(data, SetOptions(merge: true));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> deleteDoc(
      {required String collectionpath, required String docId}) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionpath)
          .doc(docId)
          .delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
