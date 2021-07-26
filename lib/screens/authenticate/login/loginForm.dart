import 'package:flutter/material.dart';
import 'package:live/provider/authenticationProvider.dart';
import 'package:live/screens/authenticate/validators.dart';
import 'package:live/shared/constants.dart';
import 'package:provider/provider.dart';

//Login form
class RenderLoginForm extends StatelessWidget {
  const RenderLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: EdgeInsets.only(top: 50),
          width: size.width * .9,
          child: Form(
            key: provider.loginFormKey,
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
                  autofocus: false,
                  validator: (value) {
                    return emailValidator(value!);
                  },
                  onChanged: (val) => provider.changeMail(val),
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
                  onChanged: (val) => provider.changePass(val),
                  decoration:
                      textInputField.copyWith(hintText: 'enter your password'),
                  obscureText: true,
                ),
                CheckboxListTile(
                  title: Text(
                    'keep me logged in',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  value: provider.isChecked,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  activeColor: Colors.white,
                  checkColor: Colors.black,
                  shape: CircleBorder(),
                  onChanged: (val) => provider.check(val!),
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: provider.submitLogin,
                        style: cbuttonStyle,
                        child: cbuttonTextStyle('log in'))),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  provider.error,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
