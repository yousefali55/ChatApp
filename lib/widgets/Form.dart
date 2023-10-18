import 'package:chatapp/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormWidget extends StatelessWidget {
  final String text1;
  final String textlabel;
  final String textfield;
  final String textlable2;
  final String textField2;
  final String textButton;
  final String TextScreen;
  final VoidCallback onPressed;
  final VoidCallback submit;
  final ValueSetter<String> onEmailChanged;
  final ValueSetter<String> onPasswordChanged;
  FormWidget({
    Key? key,
    required this.text1,
    required this.textlabel,
    required this.textfield,
    required this.textlable2,
    required this.textField2,
    required this.textButton,
    required this.TextScreen,
    required this.onPressed,
    required this.submit,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFEFECEC),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  textField(
                    hint: textfield,
                    label: textlabel,
                    onChanged: onEmailChanged,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  textField(
                    hint: textField2,
                    label: textlable2,
                    onChanged: onPasswordChanged,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: submit,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 13,
                      ),
                      child: Text(
                        text1,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        TextScreen,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed:
                            onPressed, 
                        child: Text(
                          textButton,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
