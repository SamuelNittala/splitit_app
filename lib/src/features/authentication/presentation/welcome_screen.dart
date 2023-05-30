import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitit_app/src/common_widgets/welcome_button.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WelcomeButton(
                buttonText: "Signup",
                buttonColor: Colors.green,
                textColor: Colors.white,
              ),
              SizedBox(
                height: 50,
              ),
              WelcomeButton(
                buttonText: "Login",
                buttonColor: Colors.grey,
                textColor: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
