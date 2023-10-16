import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iitkms/firebase_options.dart';
import 'package:iitkms/screens/Login_Screen.dart';
import 'package:iitkms/pallete.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
