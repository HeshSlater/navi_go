import 'package:flutter/material.dart';
import 'dart:async';
import 'welcome_getstarted.dart';

class WelcomePageOne extends StatefulWidget {
  const WelcomePageOne({super.key});

  @override
  State<WelcomePageOne> createState() => _WelcomePageOneState();
}

class _WelcomePageOneState extends State<WelcomePageOne> {
  @override
  void initState() {
    super.initState();
    // Automatically navigate to second page after 3 seconds
    Timer(Duration(seconds: 3), () {
      if (mounted) { // Safety check
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomePageTwo()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF103339),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Image
              Container(
                width: 500,
                height: 500,
                child: Image.asset(
                  'assets/Navi_G.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
