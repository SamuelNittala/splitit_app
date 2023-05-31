import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  const WelcomeButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        ),
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Text(
          buttonText,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
