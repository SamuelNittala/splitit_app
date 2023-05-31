import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitit_app/src/features/authentication/presentation/signup_screen.dart';
import 'package:splitit_app/src/features/authentication/presentation/welcome_screen.dart';

final helloWorldProvider = Provider<String>((ref) => "hello there");

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SignUpScreen(
            key: Key('123'),
          ),
        ),
      ),
    );
  }
}
