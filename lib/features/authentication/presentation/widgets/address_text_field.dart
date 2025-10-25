import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool readOnly;

  const AddressTextField({
    super.key,
    this.controller,
    this.hintText,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
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
