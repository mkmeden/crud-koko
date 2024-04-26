import 'package:crud/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
        apiKey:'AIzaSyCZC17qqHCD-WMYCs_poAbKFJgok_B2U5k',
        appId:'id',
        messagingSenderId:'sendid',
        projectId:'crud-1c25e',
        storageBucket:'crud-1c25e.appspot.com',
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
