import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/Languages.dart';
import 'package:live/screens/authenticate/validators.dart';
import 'package:live/services/authenticationService.dart';
import 'package:live/shared/constants.dart';

class RenderSignUpForm extends StatefulWidget {
  const RenderSignUpForm({Key? key, this.size, this.toggleView})
      : super(key: key);
  final size;
  final toggleView;
  @override
  _RenderSignUpFormState createState() => _RenderSignUpFormState();
}

class _RenderSignUpFormState extends State<RenderSignUpForm> {
  final _formKey = GlobalKey<FormState>();

  //registered users information
  var name;
  var phone;
  var email;
  var password = '';
  var confirmPassword;
  var _currentSelectedLanguage;
  var img;

  String error = '';

  void submitReg() async {
    if (_formKey.currentState!.validate()) {
      final result = await AuthService().signUp(email, password);
      if (result['user'] == null) {
        setState(() {
          error = result['error'].code;
        });
      } else {
        setState(() {
          error = '';
        });
        _formKey.currentState!.reset();
      }
    } else {
      print('form is not validated.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: false,
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              return nameValidator(value!);
            },
            onChanged: (value) => setState(() {
              name = value;
            }),
            style: ctextInputFieldStyle,
            decoration: textInputField.copyWith(hintText: 'Your Full Name'),
          ), //your name

          SizedBox(height: 10.0),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return phoneNoValidator(value);
            },
            onChanged: (value) => setState(() {
              phone = value;
            }),
            style: ctextInputFieldStyle,
            decoration: textInputField.copyWith(hintText: 'Your Phone Number'),
          ), //your phone number

          SizedBox(height: 10.0),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return emailValidator(value!);
            },
            onChanged: (value) => setState(() {
              email = value;
            }),
            style: ctextInputFieldStyle,
            decoration: textInputField.copyWith(hintText: 'Your Email'),
          ), //your email

          SizedBox(height: 10.0),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return passValidator(value!);
            },
            onChanged: (value) => setState(() {
              password = value;
            }),
            style: ctextInputFieldStyle,
            decoration: textInputField.copyWith(hintText: 'Password'),
            obscureText: true,
          ), //your password

          SizedBox(height: 10.0),

          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return confirmPasswordValidator(password, value!);
            },
            onChanged: (value) => setState(() {
              confirmPassword = value;
            }),
            style: ctextInputFieldStyle,
            decoration: textInputField.copyWith(hintText: 'Confirm Password'),
            obscureText: true,
            enabled: password.length >= 8 ? true : false,
          ), //confirm password

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 10),
            child: Container(
              width: widget.size.width * .6,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: Color(cborderColor), width: 2.0)),
              child: DropdownButton(
                dropdownColor: Color(0xFF000000),
                iconSize: 50,
                icon: Icon(Icons.arrow_drop_down_outlined),
                iconEnabledColor: Colors.redAccent,
                isExpanded: true,
                items: counties.map((value) {
                  return DropdownMenuItem(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.translate,
                            color: Colors.white,
                          ),
                        ),
                        Text(value)
                      ],
                    ),
                    value: value,
                  );
                }).toList(),
                underline: SizedBox(),
                hint: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.translate,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Language',
                      style: ctextInputFieldStyle,
                    )
                  ],
                ),
                style: ctextInputFieldStyle,
                value: _currentSelectedLanguage,
                onChanged: (value) {
                  setState(() {
                    _currentSelectedLanguage = value;
                  });
                },
              ),
            ),
          ),

          Container(
              width: widget.size.width * .6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  border: Border.all(color: Color(cborderColor), width: 2.0)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  primary: Colors.white10,
                ),
                child: Row(
                  children: [
                    Icon(Icons.camera_enhance),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("upload"),
                    )
                  ],
                ),
                onPressed: () {},
              )),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    submitReg();
                  },
                  style: cbuttonStyle,
                  child: cbuttonTextStyle('sign up'))),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              error,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Already have an account?',
                style: TextStyle(color: Colors.white60),
              ),
              TextButton(
                  onPressed: widget.toggleView,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
