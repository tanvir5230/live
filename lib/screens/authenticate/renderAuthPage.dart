import 'package:flutter/material.dart';
import 'package:live/provider/authenticationProvider.dart';
import 'package:live/screens/authenticate/login/loginPage.dart';
import 'package:live/screens/authenticate/signup/signupPage.dart';
import 'package:provider/provider.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) {
        return provider.showSignup ? SignUpPage() : LoginPage();
      },
    );
  }
}
