import 'package:flutter/material.dart';

void ShowSnackbox(BuildContext context, String Message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(Message),
    )
  );
}
