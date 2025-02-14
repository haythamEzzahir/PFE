import 'package:bus_tracker/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';  // Firebase initialization options (auto-generated)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure Flutter is initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Make sure you have the correct options
  );
  runApp(DevicePreview(
          builder: (context) => MyApp()
  )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}