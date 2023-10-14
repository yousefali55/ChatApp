import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class textField extends StatelessWidget {
  final String hint;
  final String label;
  Function (String)? onChanged;
  textField({Key? key, required this.hint, required this.label, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty)
        return 'Required';
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintStyle: GoogleFonts.pacifico(),
        hintText: hint, // Use the provided hint text
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
      ),
    );
  }
}