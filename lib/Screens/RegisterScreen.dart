
import 'package:chatapp/widgets/Form.dart';
import 'package:chatapp/widgets/ImageAndBackground.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  String? Email;
  String? Password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          const ImageAndBackground(),
          FormWidget(
            text1: 'Register',
            textfield: 'Enter Email',
            textlabel: 'Email',
            textField2: 'Enter Password',
            textlable2: 'Password',
            TextScreen: "If you have an account",
            textButton: 'Login',
            onPressed: () {
              Navigator.pop(context);
            },
            submit: () {  },
            onEmailChanged: (String value) {  },
            onPasswordChanged: (String value) {  },
          ),
        ],
      ),
    );
  }
}