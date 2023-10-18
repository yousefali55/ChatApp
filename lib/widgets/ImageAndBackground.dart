import 'package:chatapp/widgets/Constants.dart';
import 'package:flutter/material.dart';

class ImageAndBackground extends StatelessWidget {
  const ImageAndBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: const BoxDecoration(
        color: Color(0xFF00121),
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(logo),
        ),
      ),
    );
  }
}
