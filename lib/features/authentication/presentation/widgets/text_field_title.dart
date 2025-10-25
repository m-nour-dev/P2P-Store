import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldTitle extends StatelessWidget {
  final String textFieldTitileText;
  const TextFieldTitle({super.key, required this.textFieldTitileText});

  @override
  Widget build(BuildContext context) {
    return Text(
      textFieldTitileText,
      style: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 0, 0, 0),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 20 / 16,
      ),
    );
  }
}
