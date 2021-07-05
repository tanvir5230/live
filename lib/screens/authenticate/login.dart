import 'package:flutter/material.dart';
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
            LoginForm(
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

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key, this.size, this.toggleView}) : super(key: key);
  final size;
  final toggleView;
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  // form input value
  bool isChecked = false;
  String email = '';
  String password = '';

  bool emailValidator(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  bool passValidator(String value) {
    if (value.length >= 8) {
      return true;
    } else {
      return false;
    }
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      print(
          "email is $email and pass is $password and checked box is $isChecked");
    } else {
      print("not validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * .9,
      height: widget.size.height * .6,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Log in',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Required. Must enter your email address.";
                } else if (emailValidator(val)) {
                  return null;
                } else {
                  return "You must enter a valid email address.";
                }
              },
              onChanged: (val) => setState(() {
                email = val;
              }),
              style: ctextInputFieldStyle,
              decoration: textInputField.copyWith(hintText: 'your email'),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: ctextInputFieldStyle,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "required";
                } else if (passValidator(val)) {
                  return null;
                } else {
                  return "your password must have at least 8 characters.";
                }
              },
              onChanged: (val) => setState(() {
                password = val;
              }),
              decoration:
                  textInputField.copyWith(hintText: 'enter your password'),
              obscureText: true,
            ),
            CheckboxListTile(
              title: Text(
                'keep me logged in',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              value: this.isChecked,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: Colors.white,
              checkColor: Colors.black,
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: submit,
                    style: cbuttonStyle,
                    child: cbuttonTextStyle('log in'))),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.white60),
                ),
                TextButton(
                    onPressed: widget.toggleView,
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
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
