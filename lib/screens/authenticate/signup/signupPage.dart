import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/signup/signupForm.dart';
import 'package:live/shared/constants.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key, this.toggleView}) : super(key: key);
  final toggleView;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        //height: size.height,
        color: Color(formBgColor),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 100,
                width: double.infinity,
                child: Logo(),
              ),
            ),
            Text(
              'Registration',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ), // logo container
            Container(
              width: size.width * .90,
              // height: size.height * 0.80,
              child: RenderSignUpForm(
                size: size,
                toggleView: toggleView,
              ),
            ), //form container
            Container(
              width: double.infinity,
              height: 50,
              child: Text(
                'By clicking sign up you\'ll agree and accept\n all of our terms and privacy policy.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(normalTextColor),
                ),
              ),
            ), //footer container
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/app_logo_white_large.png',
        height: 50,
        width: 150,
      ),
    );
  }
}
