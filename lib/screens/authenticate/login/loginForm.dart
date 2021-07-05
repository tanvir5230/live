import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/validators.dart';
import 'package:live/shared/constants.dart';

//Login form
class RenderLoginForm extends StatefulWidget {
  const RenderLoginForm({Key? key, this.size, this.toggleView})
      : super(key: key);
  final size;
  final toggleView;
  @override
  _RenderLoginFormState createState() => _RenderLoginFormState();
}

class _RenderLoginFormState extends State<RenderLoginForm> {
  final _formKey = GlobalKey<FormState>();

  // form input value
  bool isChecked = false;
  String email = '';
  String password = '';

//login form submit function
  void submit() {
    if (_formKey.currentState!.validate()) {
      print(
          "email is $email and pass is $password and checked box is $isChecked");
      _formKey.currentState!.reset();
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
              autofocus: true,
              validator: (value) {
                return emailValidator(value!);
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
              validator: (value) {
                return passValidator(value!);
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
              value: isChecked,
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: Colors.white,
              checkColor: Colors.black,
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() => isChecked = value!);
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
