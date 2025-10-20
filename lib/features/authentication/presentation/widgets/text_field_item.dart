import 'package:flutter/material.dart';

class TextFieldItem extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool obscure;

  const TextFieldItem({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.obscure = false,
  });

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 317),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        validator: (input) {
          if (widget.controller.text.isEmpty) {
            return 'Please enter your ${widget.hintText}';
          }
          return null;
        },
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF3F3F3),
          prefixIcon: widget.icon != null
              ? Icon(widget.icon, color: Color(0xFF555555))
              : null,
          suffixIcon: widget.obscure
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: const Color(0xFF555555),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Color(0xFF999999), fontSize: 16),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD1D1D1), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD1D1D1), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFFF4C61), width: 1.5),
          ),
        ),
      ),
    );
  }
}
