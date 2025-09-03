import 'package:flutter/material.dart';
import 'translations.dart';
import 'area.dart';

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  String selectedLanguage = 'English'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              // Title
              _buildTitle(),

              const SizedBox(height: 60),

              // Language Options
              _buildLanguageOptions(),

              const Spacer(),

              // Bottom illustration
              _buildBottomIllustration(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      tr('choose_language'),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontFamily: 'Rufina',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildLanguageOptions() {
    return Column(
      children: [
        _buildLanguageButton('English'),
        const SizedBox(height: 12),
        _buildLanguageButton('Sinhala'),
        const SizedBox(height: 15),
        _buildLanguageButton('Tamil'),
      ],
    );
  }

  Widget _buildLanguageButton(String language) {
    bool isSelected = selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });

        // Set the app language
        AppTranslations.setLanguage(language);

        // Navigate to area selection page after selection
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) {
            print('Selected language: $language');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AreaSelection()),
            );
          }
        });
      },
      child: Container(
        width: 270,
        height: 46,
        decoration: ShapeDecoration(
          color: isSelected
              ? const Color(0xFF1D4F58) // Selected - dark teal
              : const Color(0xFFC7DFE1), // Unselected - light teal
          shape: RoundedRectangleBorder(
            side: isSelected
                ? BorderSide(width: 3, color: const Color(0xFF1D4F58))
                : BorderSide.none,
            borderRadius: BorderRadius.circular(20),
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
        child: Center(
          child: Text(
            tr(language.toLowerCase()),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              shadows: [
                Shadow(
                  offset: Offset(6, 6),
                  blurRadius: 4,
                  color: Color(0xFF000000).withOpacity(0.25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomIllustration() {
    return Container(
      width: 317,
      height: 317,
      child: Image.asset(
        'assets/LanguageSelection.png',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 317,
            height: 317,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.language,
              size: 100,
              color: Colors.grey[400],
            ),
          );
        },
      ),
    );
  }
}