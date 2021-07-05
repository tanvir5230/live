import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/login/loginForm.dart';
import 'package:live/shared/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, this.toggleView}) : super(key: key);
  final toggleView;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        color: Color(formBgColor),
        child: Column(
          children: <Widget>[
            Logo(
              size: size,
            ),
            RenderLoginForm(
              size: size,
              toggleView: toggleView,
            ),
            LoginFooter(),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key, this.size}) : super(key: key);

  final size;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height * 0.30,
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
        ));
  }
}

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        'member of @world group',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
