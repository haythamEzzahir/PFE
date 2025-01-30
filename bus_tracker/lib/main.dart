import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:bus_tracker/pages/homepage.dart';
import 'package:flutter/material.dart';


 void main()async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options:DefaultFirebaseOptions.currentPlatform
  // )
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
     

    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const Homepage(),
    );
  }
}
