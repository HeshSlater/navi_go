import 'package:flutter/material.dart';
import 'translations.dart';
import 'register.dart';

class AreaSelection extends StatefulWidget {
  const AreaSelection({super.key});

  @override
  State<AreaSelection> createState() => _AreaSelectionState();
}

class _AreaSelectionState extends State<AreaSelection> {
  // List of all areas in Western Province
  final List<String> allAreas = [
    'Colombo', 'Gampaha', 'Negombo',
    'Kaluthara', 'Wattala', 'Dehiwala',
    'Maharagama', 'Katunayake',
    'Panadura', 'Mirigama', 'Horana',
    'Yakkala', 'Kaduwela', 'Divulapitiya',
    'Bambalapitiya', 'Battaramulla',
    'Kelaniya', 'Homagama', 'Aluthgama',
    'Moratuwa', 'Borella', 'Malabe',
    'Dodangoda', 'Biyagama', 'Ja-Ela',
    'Minuwangoda'
  ];

  // Track selected areas - default selections
  Set<String> selectedAreas = { };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // Title
              _buildTitle(),

              const SizedBox(height: 40),

              // Areas Grid
              Expanded(
                child: _buildAreasGrid(),
              ),

              // Next Button
              _buildNextButton(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      tr('select_areas'),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 32,
        fontFamily: 'Rufina',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildAreasGrid() {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 8,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: allAreas.map((area) => _buildAreaChip(area)).toList(),
      ),
    );
  }

  Widget _buildAreaChip(String area) {
    bool isSelected = selectedAreas.contains(area);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedAreas.remove(area);
          } else {
            selectedAreas.add(area);
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: ShapeDecoration(
          color: isSelected
              ? const Color(0xFF3D9196) // Selected - dark teal
              : const Color(0xFFC7DFE1), // Unselected - light teal
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(4, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Text(
          tr(area.toLowerCase().replaceAll('-', '_')),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            shadows: [
              Shadow(
                offset: Offset(4, 4),
                blurRadius: 4,
                color: Color(0xFF000000).withOpacity(0.25),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: selectedAreas.isEmpty ? null : () {
          print('Selected areas: ${selectedAreas.toList()}');
          // Navigate to registration page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationScreen(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: selectedAreas.isEmpty
                ? Colors.grey[300]
                : const Color(0xFF1D4F58),
            borderRadius: BorderRadius.circular(25),
            boxShadow: selectedAreas.isNotEmpty ? [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(4, 4),
                spreadRadius: 0,
              ),
            ] : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tr('next'),
                style: TextStyle(
                  color: selectedAreas.isEmpty ? Colors.grey[600] : Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: selectedAreas.isEmpty ? Colors.grey[600] : Colors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
