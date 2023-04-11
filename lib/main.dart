import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hostely/controllers/user.controller.dart';
import 'package:hostely/views/home.view.dart';
import 'package:hostely/views/splash.view.dart';
import 'controllers/firebase/firebase.controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bindDependencies();
  runApp(const MyApp());
}

void bindDependencies() {
  Get.put(FirebaseContorller());
  Get.put(UserController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Happy Living',
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen());
  }
}
