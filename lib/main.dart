import 'package:crisis_friend/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Crisis Friend',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
