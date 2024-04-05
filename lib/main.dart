import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:help_pet_app/pages/screen_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyAh1uSdrLTMUxTRNdhzBzKVUZ9iFzp4XfM",
      appId: "1:342259377951:android:c73047114d0e0b1a83322a",
      messagingSenderId: "342259377951",
      projectId: "help-petapp",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help-pet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Pantalla de splash como pantalla de inicio
    );
  }
}
