import 'package:flutter/material.dart';
import 'screens/welcome.dart'; // Adjust path as needed

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaviGo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins', // Set default font
      ),
      home: WelcomePageOne(), // Start with first welcome page
      debugShowCheckedModeBanner: false, // Removes debug banner
    );
  }
}