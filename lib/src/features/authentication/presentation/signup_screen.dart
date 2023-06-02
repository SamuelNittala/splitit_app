import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitit_app/src/common_widgets/input_field.dart';
import 'package:splitit_app/src/features/authentication/presentation/auth_providers.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(Object context, WidgetRef ref) {
    SignupState signUpState = ref.watch(signupControllerProvider);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800]),
              ),
              const SizedBox(height: 50),
              InputFieldWidget(
                  labelText: "Phone no",
                  labelStyle: TextStyle(color: Colors.blueGrey[600]),
                  inputStyle: TextStyle(color: Colors.blueGrey[800]),
                  onChanged: (value) {
                    signUpState.signupData.phoneNumber = value;
                  }),
              const SizedBox(height: 50),
              InputFieldWidget(
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.blueGrey[600]),
                  inputStyle: TextStyle(color: Colors.blueGrey[800]),
                  onChanged: (value) {
                    signUpState.signupData.username = value;
                  }),
              const SizedBox(height: 50),
              InputFieldWidget(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.blueGrey[600]),
                  inputStyle: TextStyle(color: Colors.blueGrey[800]),
                  onChanged: (value) {
                    signUpState.signupData.email = value;
                  }),
              const SizedBox(height: 50),
              InputFieldWidget(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.blueGrey[600]),
                  inputStyle: TextStyle(color: Colors.blueGrey[800]),
                  onChanged: (value) {
                    signUpState.signupData.password = value;
                  }),
              const SizedBox(height: 50),
              TextButton(
                style:
                    TextButton.styleFrom(backgroundColor: Colors.blueGrey[800]),
                onPressed: () =>
                    ref.read(signupControllerProvider.notifier).signup(),
                child: Text('Register', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
