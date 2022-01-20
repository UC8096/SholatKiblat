import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sholatkiblat/helpers/helpers.dart';
import 'package:sholatkiblat/routes/routes.dart';
import 'controllers/controllers.dart';
import 'package:dcdg/dcdg.dart';

int? initScreen;

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());

  initScreen = await onBoardingController.initFirstScreen();

  NotificationHelper.initialize();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initScreen == null ? '/onboarding' : '/home',
      getPages: AppRoute.getPages(),
    );
  }
}
