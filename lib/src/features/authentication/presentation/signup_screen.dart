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
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputFieldWidget(
                  labelText: "Phone no",
                  onChanged: (value) {
                    signUpState.signupData.phoneNumber = value;
                  }),
              const SizedBox(
                height: 50,
              ),
              InputFieldWidget(
                  labelText: "Username",
                  onChanged: (value) {
                    signUpState.signupData.username = value;
                  }),
              const SizedBox(
                height: 50,
              ),
              InputFieldWidget(
                  labelText: "Email",
                  onChanged: (value) {
                    signUpState.signupData.email = value;
                  }),
              const SizedBox(
                height: 50,
              ),
              InputFieldWidget(
                  labelText: "Password",
                  onChanged: (value) {
                    signUpState.signupData.password = value;
                  }),
              const SizedBox(
                height: 50,
              ),
              InputFieldWidget(
                  labelText: "First Name",
                  onChanged: (value) {
                    signUpState.signupData.firstName = value;
                  }),
              const SizedBox(
                height: 50,
              ),
              InputFieldWidget(
                  labelText: "Last Name",
                  onChanged: (value) {
                    signUpState.signupData.lastName = value;
                  }),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () =>
                    ref.read(signupControllerProvider.notifier).signup(),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
