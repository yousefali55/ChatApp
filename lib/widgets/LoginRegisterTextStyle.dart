import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegisterText extends StatelessWidget {
  const LoginRegisterText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inriaSans(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
        fontSize: 40,
      ),
    );
  }
}