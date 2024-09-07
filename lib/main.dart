import 'package:camera/camera.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:math';
import 'package:sdp/screens/home_screen.dart';
import 'package:sdp/screens/yoga_list_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


late List<CameraDescription> cameras;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }
  // Initialize camera
  await Firebase.initializeApp();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: ${e.code}\nError Message: ${e.description}');
  }
  // await Firebase.initializeApp();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // NotificationSettings settings = await messaging.requestPermission();
  //
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Received a message: ${message.messageId}');
  // });
  // // Initialize notifications
  // const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  //
  // final InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );
  //
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //
  // // Schedule the daily notification
  // scheduleDailyNotification();

  runApp(RituCycleApp());
}

// Future<void> scheduleDailyNotification() async {
//   final List<String> quotes = [
//     "Believe in yourself.",
//     "You are stronger than you think.",
//     "Every day is a new opportunity.",
//     "Embrace your inner strength.",
//     "You are capable of amazing things.",
//     // Add more quotes as needed
//   ];
//
//   String getRandomQuote() {
//     final random = Random();
//     return quotes[random.nextInt(quotes.length)];
//   }

//   const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//     'daily_quote_channel_id',
//     'Daily Motivational Quote',
//     // Use correct constructor parameters
//     importance: Importance.max,
//     priority: Priority.high,
//     playSound: true,
//     showWhen: false,
//     // Add more parameters if needed
//   );
//
//   const NotificationDetails notificationDetails = NotificationDetails(
//     android: androidNotificationDetails,
//   );
//
//   await flutterLocalNotificationsPlugin.showDailyAtTime(
//     0,
//     'Daily Motivation',
//     getRandomQuote(),
//     const Time(8, 0, 0), // Set the time for 8:00 AM every day
//     notificationDetails,
//   );
// }

class RituCycleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RituCycle',
      theme: AppTheme.lightTheme,
      home: SplashScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(cameras: cameras),
      },
    );
  }
}
