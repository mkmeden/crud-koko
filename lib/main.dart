import 'package:crud/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options:FirebaseOptions(
        apiKey:'AIzaSyCuaP-3eDBzWHTh_yz-5q5kGm8X-kNNRvI',
        appId:'id',
        messagingSenderId:'sendid',
        projectId:'crud-koko',
        storageBucket:'crud-koko.appspot.com',
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
