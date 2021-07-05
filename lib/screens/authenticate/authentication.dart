import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/login.dart';
import 'package:live/screens/authenticate/signup.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool showSignup = true;

  void toggleView() {
    setState(() {
      showSignup = !showSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !showSignup
        ? LoginPage(
            toggleView: this.toggleView,
          )
        : SignUpPage(toggleView: this.toggleView);
  }
}
