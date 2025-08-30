import 'package:flutter/material.dart';
import 'area.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose your language",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),

            // English Button
            ElevatedButton(
              onPressed: () {},
              child: const Text("English"),
            ),

            // Sinhala Button
            OutlinedButton(
              onPressed: () {},
              child: const Text("සිංහල"),
            ),

            // Tamil Button
            OutlinedButton(
              onPressed: () {},
              child: const Text("தமிழ்"),
            ),
          ],
        ),
      ),
    );
  }
}
