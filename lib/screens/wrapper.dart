import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/authentication.dart';
import 'package:live/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '@live',
      home: const Scaffold(
        body: const AuthenticationPage(),
      ),
    );
  }
}
