import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/coutriesLanguages.dart';
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
                height: size.height * .15,
                width: double.infinity,
                child: Logo(),
              ),
            ), // logo container
            Container(
              width: size.width * .90,
              height: size.height * .80,
              child: SignUpForm(
                size: size,
                toggleView: toggleView,
              ),
            ), //form container
            Container(
                width: double.infinity,
                height: size.height * .10,
                child: Text(
                  "By clicking sign up you'll agree and accept\n all of our terms and privacy policy.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(normalTextColor),
                  ),
                )) //footer container
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key, this.size, this.toggleView}) : super(key: key);
  final size;
  final toggleView;
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var _currentSelectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {},
          onChanged: (val) => setState(() {}),
          style: ctextInputFieldStyle,
          decoration: textInputField.copyWith(hintText: 'Your Full Name'),
        ), //your name

        SizedBox(height: 10.0),

        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {},
          onChanged: (val) => setState(() {}),
          style: ctextInputFieldStyle,
          decoration: textInputField.copyWith(hintText: 'Your Phone Number'),
        ), //your phone number

        SizedBox(height: 10.0),

        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {},
          onChanged: (val) => setState(() {}),
          style: ctextInputFieldStyle,
          decoration: textInputField.copyWith(hintText: 'Your Email'),
        ), //your email

        SizedBox(height: 10.0),

        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {},
          onChanged: (val) => setState(() {}),
          style: ctextInputFieldStyle,
          decoration: textInputField.copyWith(hintText: 'Password'),
          obscureText: true,
        ), //your password

        SizedBox(height: 10.0),

        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (val) {},
          onChanged: (val) => setState(() {}),
          style: ctextInputFieldStyle,
          decoration: textInputField.copyWith(hintText: 'Confirm Password'),
          obscureText: true,
        ),

        //confirm password
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
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
                onPressed: () {},
                style: cbuttonStyle,
                child: cbuttonTextStyle('sign up'))),
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
                ))
          ],
        ),
      ],
    );
  }
}
