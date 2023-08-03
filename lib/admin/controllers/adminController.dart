import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/controllers/firebase/firebase.controller.dart';
import 'package:hostely/models/user.model.dart';

class AdminController extends GetxController {
  @override
  void onInit() {
    getNonApprovedUsers();
    getAllusers();
    super.onInit();
  }

  Map<String, List<UserModel>> roomMappings = {};

  List<UserModel> unApprovedStudents = [];
  List<String> unApprovedIds = [];

  Future getAllusers() async {
    roomMappings = {};
    List<QueryDocumentSnapshot<Map<String, dynamic>>> users =
        await FirebaseContorller().getallDocuments(
            collectionPath: "users", isEqualTo: true, feild: "approved");
    for (var i = 0; i < users.length; i++) {
      UserModel user = UserModel.fromJson(users[i].data());
      if (user.roomNo.isNotEmpty) {
        if (roomMappings.containsKey(user.roomNo)) {
          roomMappings[user.roomNo]?.add(user);
        } else {
          roomMappings[user.roomNo] = [user];
        }
      }
    }
    print(roomMappings);
    update();
  }

  Future approveUser(
      {required String uid,
      required String rent,
      required String roomNo}) async {
    EasyLoading.show(status: "Approving user");
    await FirebaseContorller().setDoc(
        collectionPath: "users",
        document: uid,
        data: {"approved": true, "rent": rent, "roomNo": roomNo});
    Get.back();
    getNonApprovedUsers();
    EasyLoading.dismiss();
    EasyLoading.showSuccess("User approved");
  }

  Future deleteUser({required String uid}) async {
    EasyLoading.show(status: "Deleting user");
    await FirebaseContorller().deleteDoc(collectionpath: "users", docId: uid);
    getNonApprovedUsers();
    EasyLoading.dismiss();
  }

  Future getNonApprovedUsers() async {
    unApprovedStudents = [];
    unApprovedIds = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>> users =
        await FirebaseContorller().getallDocuments(
            collectionPath: "users", isEqualTo: false, feild: "approved");
    for (var i = 0; i < users.length; i++) {
      unApprovedStudents.add(UserModel.fromJson(users[i].data()));
      unApprovedIds.add(users[i].id);
    }
    update();
    return;
  }
}
