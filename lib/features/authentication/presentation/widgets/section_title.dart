import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String sectionTitleText;
  const SectionTitle({super.key, required this.sectionTitleText});

  @override
  Widget build(BuildContext context) {
    return Text(
      sectionTitleText,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 20 / 16,
      ),
    );
  }
}
