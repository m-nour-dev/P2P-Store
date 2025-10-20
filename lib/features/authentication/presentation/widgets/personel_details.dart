import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonelDetails extends StatelessWidget {
  final String text;
  final bool readOnly;
  const PersonelDetails({
    super.key,
    required this.text,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: TextEditingController(text: text),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      ),
      style: GoogleFonts.montserrat(
        color: Colors.black87,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
