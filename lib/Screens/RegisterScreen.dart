import 'package:chatapp/widgets/FlutterToast.dart';
import 'package:chatapp/widgets/Form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/ImageAndBackground.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static String id = 'RegisterScreen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        inAsyncCall: isLoading,
        child: Column(
          children: [
            ImageAndBackground(),
            FormWidget(
              text1: 'Register',
              textfield: 'Enter Email',
              textlabel: 'Email',
              textField2: 'Enter Password',
              textlable2: 'Password',
              textButton: 'Login',
              TextScreen: "If you have an account",
              onPressed: () {
                Navigator.pop(context);
              },
              submit: () async {
                isLoading = true;
                setState(() {});
                try {
                  var auth = FirebaseAuth.instance;
                  UserCredential user = await auth.createUserWithEmailAndPassword(
                      email: email!, password: password!);
                  showToast('Registration successful: ${user.user?.email}');
                } catch (error) {
                  Fluttertoast.showToast(
                    msg: '$error',
                    gravity: ToastGravity.BOTTOM,
                    textColor: Colors.green,
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: const Color(0xFFEFECEC),
                  );
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
