import 'package:chatapp/widgets/FlutterToast.dart';
import 'package:chatapp/widgets/Form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Screens/RegisterScreen.dart';
import 'package:chatapp/widgets/ImageAndBackground.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatelessWidget {
  String? email;
  String? password;
  LoginScreen({Key? key}) : super(key: key);
  void onEmailChanged(String value){
    email = value;
  }
  void onPasswordChanged(String value){
    password = value;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageAndBackground(),
        FormWidget(
          text1: 'Login',
          textfield: 'Enter Email',
          textlabel: 'Email',
          textField2: 'Enter Password',
          textlable2: 'Password',
          textButton: 'Register',
          TextScreen: "If you haven't got an account",
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          submit: ()async{
            try{
            var auth = FirebaseAuth.instance;
            UserCredential user = await auth.createUserWithEmailAndPassword(
            email: email!,
            password: password!);
            showToast('Registration successful: ${user.user?.email}');
            }
            catch(error)
            {
              Fluttertoast.showToast(
                msg: '$error',
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.green,
                toastLength: Toast.LENGTH_LONG,
                backgroundColor: const Color(0xFFEFECEC),
              );
            }
          },
          onEmailChanged: onEmailChanged,
          onPasswordChanged: onPasswordChanged,
        ),
      ],
    );
  }
}
