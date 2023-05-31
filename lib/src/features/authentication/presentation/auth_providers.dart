import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SignupData {
  String email;
  String phoneNumber;
  String username;
  String password;
  String firstName;
  String lastName;

  SignupData({
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}

final signupControllerProvider =
    StateNotifierProvider<SignupController, SignupState>(
        (ref) => SignupController());

enum SignupStatus { initial, loading, success, error }

class SignupState {
  SignupStatus status;
  SignupData signupData;

  SignupState({this.status = SignupStatus.initial, required this.signupData});

  SignupState copyWith({SignupStatus? status}) {
    return SignupState(status: status ?? this.status, signupData: signupData);
  }
}

class SignupController extends StateNotifier<SignupState> {
  SignupController()
      : super(
          SignupState(
            status: SignupStatus.initial,
            signupData: SignupData(
                email: '',
                phoneNumber: '',
                firstName: '',
                lastName: '',
                password: '',
                username: ''),
          ),
        );

  Future<void> signup() async {
    state = state.copyWith(status: SignupStatus.loading);
    final url = "${dotenv.env['BACKEND_URL']}/register";
    final response = await http.post(
      Uri.parse(url), // Replace with your backend URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'email': state.signupData.email,
        'phoneNumber': state.signupData.phoneNumber,
        'user_name': state.signupData.username,
        'password': state.signupData.password,
        'first_name': state.signupData.firstName,
        'last_name': state.signupData.lastName
      }),
    );

    if (response.statusCode == 200) {
      state = state.copyWith(status: SignupStatus.success);
    } else {
      state = state.copyWith(status: SignupStatus.error);
    }
  }
}
