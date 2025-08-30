import 'package:flutter/material.dart';

/// Translations for areas
final Map<String, List<String>> areaTranslations = {
  "en": [
    "Colombo", "Gampaha", "Negombo", "Kaluthara", "Wattala",
    "Dehiwala", "Katunayake", "Panadura", "Mirigama", "Horana",
    "Yakkala", "Divulapitiya", "Bambalapitiya", "Kaduwela",
    "Battaramulla", "Moratuwa", "Maharagama", "Kelaniya",
    "Homagama", "Borella", "Aluthgama", "Ja-Ela",
    "Dodangoda", "Minuwangoda", "Biyagama"
  ],
  "si": [
    "කොළඹ", "ගම්පහ", "නේගොම්බෝ", "කළුතර", "වැටල",
    "දෙහිවල", "කතුනායක", "පානදුර", "මිරිගම", "හොරන",
    "යක්කල", "දිවුලපිටිය", "බම්බලපිටිය", "කඩුවැල",
    "බත්තරමුල්ල", "මොරටුව", "මහරගම", "කැලණිය",
    "හොමාගම", "බොරැල්ල", "අලුත්ගම", "ජාඇල",
    "දොඩන්ගොඩ", "මිනුවන්ගොඩ", "බියගම"
  ],
  "ta": [
    "கொழும்பு", "கம்பஹா", "நெகோம்போ", "களுத்துறை", "வட்டள",
    "தேஹிவளை", "கடுநாயக்க", "பானதுர", "மிரிகம", "ஹோரண",
    "யக்கல", "திவுலபிடிய", "பம்பலப்பிட்டிய", "கடுவெல",
    "பத்தரமுல்ல", "மொரட்டுவ", "மகரகம", "கேளணிய",
    "ஹோமாகம", "பொரெல்ல", "அலுத்தகம", "ஜா-எல",
    "தொடங்கொட", "மினுவன்கொட", "பியகம"
  ],
};

class AreaScreen extends StatefulWidget {
  final String language; // "en", "si", "ta"

  const AreaScreen({super.key, required this.language});

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  String? selectedArea;

  @override
  Widget build(BuildContext context) {
    final areas = areaTranslations[widget.language] ?? areaTranslations["en"]!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.language == "en"
              ? "Select your area"
              : widget.language == "si"
              ? "ඔබගේ ප්‍රදේශය තෝරන්න"
              : "உங்கள் பகுதியைத் தேர்ந்தெடுக்கவும்",
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5, // wider buttons
          ),
          itemCount: areas.length,
          itemBuilder: (context, index) {
            final area = areas[index];
            final isSelected = selectedArea == area;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedArea = area;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.black : Colors.grey,
                    width: 2,
                  ),
                ),
                child: Text(
                  area,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          onPressed: () {
            if (selectedArea != null) {
              // Navigate to the next screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Selected Area: $selectedArea")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please select an area")),
              );
            }
          },
          child: Text(
            widget.language == "en"
                ? "Next"
                : widget.language == "si"
                ? "ඊළඟ"
                : "அடுத்தது",
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

