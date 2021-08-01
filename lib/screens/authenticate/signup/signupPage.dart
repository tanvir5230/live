import 'package:flutter/material.dart';
import 'package:live/provider/authenticationProvider.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:live/screens/authenticate/signup/signupForm.dart';
import 'package:live/screens/loading.dart';
import 'package:live/shared/constants.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) => provider.signupLoading
          ? Loading()
          : LayoutBuilder(
              builder: (context, constrains) {
                if (constrains.maxWidth < 600) {
                  return Container(
                    width: size.width,
                    height: size.height,
                    color: Color(formBgColor),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SafeArea(
                              child: Container(
                                height: 80,
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
                              child: RenderSignUpForm(),
                            ),
                            signupFooter(provider),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (constrains.maxWidth > 600 &&
                    constrains.maxWidth < 1000) {
                  return Container(
                    width: size.width,
                    height: size.height,
                    color: Color(formBgColor),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Logo(),
                            Text(
                              'Registration',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 600,
                              child: RenderSignUpForm(),
                            ),
                            signupFooter(provider),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      AuthHeaderForPC(),
                      Container(
                        height: size.height - 60,
                        color: Color(formBgColor),
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 600,
                                  child: RenderSignUpForm(),
                                ),
                                signupFooter(provider),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
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

Widget signupFooter(provider) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.only(bottom: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account?',
              style: TextStyle(color: Colors.white60),
            ),
            TextButton(
              onPressed: provider.toggleView,
              child: Text(
                'Log in',
                style: TextStyle(
                    color: Colors.white, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
        Text(
          'By clicking sign up you\'ll agree and accept\n all of our terms and privacy policy.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(normalTextColor),
          ),
        ),
      ],
    ),
  );
}
