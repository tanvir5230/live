import 'package:flutter/material.dart';
import 'package:live/provider/authenticationProvider.dart';
import 'package:live/screens/authenticate/login/loginForm.dart';
import 'package:live/screens/loading.dart';
import 'package:live/shared/constants.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, this.toggleView}) : super(key: key);
  final toggleView;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) => provider.loginLoading
          ? Loading()
          : Container(
              width: size.width,
              height: size.height,
              color: Color(formBgColor),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Logo(),
                    RenderLoginForm(),
                    LoginFooter(),
                  ],
                ),
              ),
            ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Image.asset(
              'assets/images/app_logo_white_small.png',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) => Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.white60),
              ),
              TextButton(
                onPressed: provider.toggleView,
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'member of @world group',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
