import 'package:flutter/material.dart';

class WelcomePageTwo extends StatelessWidget {
  const WelcomePageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Bus illustration image
              _buildIllustration(),

              const SizedBox(height: 40),

              // Welcome to NaviGo text
              _buildWelcomeText(),

              const SizedBox(height: 24),

              // "Find your bus anytime anywhere" tagline
              _buildMainTagline(),

              const SizedBox(height: 16),

              // Description text
              _buildDescription(),

              const Spacer(),

              // Get Started Button
              _buildGetStartedButton(context),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      width: double.infinity,
      height: 264,
      child: Image.asset(
        'assets/BusPassengers.png', // Replace with your actual image path
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Welcome to \n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 32,
              fontFamily: 'Rufina',
              fontWeight: FontWeight.w700,
              height: 1.56,
            ),
          ),
          TextSpan(
            text: 'NaviGo',
            style: TextStyle(
              color: const Color(0xFF1D4F58), // Your brand teal color
              fontSize: 64,
              fontFamily: 'Rufina',
              fontWeight: FontWeight.w700,
              height: 0.78,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildMainTagline() {
    return Text(
      'Find your bus anytime anywhere',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Rufina',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      'Track your bus in real time with live \nGPS updates, so you always \nknow where it is.',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w200,
        height: 1.4,
      ),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 46,
      decoration: ShapeDecoration(
        color: const Color(0xFF1D4F58), // Your brand teal color
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 3,
            color: const Color(0xFF1D4F58),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(6, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Navigate to language selection page
            print('Get Started pressed!');
            // Navigator.pushNamed(context, '/language');
          },
          borderRadius: BorderRadius.circular(15),
          child: Center(
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}