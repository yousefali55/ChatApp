import 'package:chatapp/Functions/Snackbox.dart';
import 'package:chatapp/Screens/ChatPage.dart';
import 'package:chatapp/Screens/RegisterScreen.dart';
import 'package:chatapp/widgets/Form.dart';
import 'package:chatapp/widgets/ImageAndBackground.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;

  bool isLoading = false;
  void onEmailChanged(String value) {
    email = value;
  }

  void onPasswordChanged(String value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Column(
          children: [
            const ImageAndBackground(),
            FormWidget(
              text1: 'Login',
              textfield: 'Enter Email',
              textlabel: 'Email',
              textField2: 'Enter Password',
              textlable2: 'Password',
              TextScreen: "If you haven't got an account",
              textButton: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              submit: () async {
                isLoading = true;
                setState(() {});
                try {
                  var auth = FirebaseAuth.instance;
                  UserCredential user = await auth.signInWithEmailAndPassword(
                      email: email!, password: password!);
                      Navigator.pushNamed(context, ChatScreen.id);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    ShowSnackbox(context, 'No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    ShowSnackbox(
                        context, 'Wrong password provided for that user.');
                  } else {
                    print('Firebase Auth Error: ${e.code}, ${e.message}');
                  }
                } catch (e) {
                  print('Error: $e');
                }
                isLoading = false;
                setState(() {});
              },
              onEmailChanged: onEmailChanged,
              onPasswordChanged: onPasswordChanged,
            ),
          ],
        ),
      ),
    );
  }
}
