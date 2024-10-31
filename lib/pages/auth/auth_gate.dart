// ../../washking/washking/lib/pages/auth/auth_gate.dart
import 'package:flutter/material.dart';
import 'package:monitor_me/pages/auth/sign_in.dart';
import 'package:monitor_me/pages/user/home.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const HomePage() : const SigninPage();
  }
}
