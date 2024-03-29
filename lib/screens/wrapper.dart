import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:live/provider/authenticationProvider.dart';
import 'package:live/screens/authenticate/renderAuthPage.dart';
import 'package:live/screens/home/home.dart';
import 'package:live/screens/loading.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChangeNotifierProvider<HomepageProvider>(
            create: (context) => HomepageProvider(),
            child: Home(),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else if (snapshot.hasError) {
          return Text('error');
        } else {
          return ChangeNotifierProvider<AuthenticationProvider>(
            create: (context) => AuthenticationProvider(),
            child: AuthenticationPage(),
          );
        }
      },
    );
  }
}
