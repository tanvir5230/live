import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live/provider/authenticationProvider.dart';
import 'package:live/screens/authenticate/Languages.dart';
import 'package:live/screens/authenticate/validators.dart';
import 'package:live/shared/constants.dart';
import 'package:provider/provider.dart';

class RenderSignUpForm extends StatelessWidget {
  const RenderSignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AuthenticationProvider>(
      builder: (context, provider, child) => Form(
        key: provider.signupFormKey,
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
              onChanged: (value) => provider.changeName(value),
              style: ctextInputFieldStyle,
              decoration: textInputField.copyWith(hintText: 'Your Full Name'),
            ), //your name

            SizedBox(height: 10.0),

            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(cborderRadius)),
                border: Border.all(color: Colors.white70, width: 2.0),
              ),
              child: IntlPhoneField(
                autoValidate: true,
                decoration: InputDecoration(
                  hintText: 'your phone number',
                  hintStyle: TextStyle(color: Colors.white54),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  counterStyle: TextStyle(color: Colors.white),
                ),
                style: TextStyle(color: Colors.white),
                countryCodeTextColor: Colors.white,
                dropDownArrowColor: Colors.white,
                textAlign: TextAlign.center,
                initialCountryCode: 'QA',
                onChanged: (phone) {
                  provider.changePhone(phone.number.toString());
                },
                onCountryChanged: (phone) {
                  provider.changeCountryCode(phone.countryCode.toString());
                },
              ),
            ),

            SizedBox(height: 10.0),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return emailValidator(value!);
              },
              onChanged: (value) => provider.changeMail(value),
              style: ctextInputFieldStyle,
              decoration: textInputField.copyWith(hintText: 'Your Email'),
            ), //your email

            SizedBox(height: 10.0),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return passValidator(value!);
              },
              onChanged: (value) => provider.changePass(value),
              style: ctextInputFieldStyle,
              decoration: textInputField.copyWith(hintText: 'Password'),
              obscureText: true,
            ), //your password

            SizedBox(height: 10.0),

            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                return confirmPasswordValidator(provider.password, value!);
              },
              onChanged: (value) => provider.passConfirmation(value),
              style: ctextInputFieldStyle,
              decoration: textInputField.copyWith(hintText: 'Confirm Password'),
              obscureText: true,
              enabled: provider.password.length >= 8 ? true : false,
            ), //confirm password

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Container(
                width: size.width * .6,
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
                  items: languages.map((value) {
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
                      ),
                    ],
                  ),
                  style: ctextInputFieldStyle,
                  value: provider.currentSelectedLanguage,
                  onChanged: (value) => provider.selectLanguage(value),
                ),
              ),
            ),
            provider.currentSelectedLanguage == null &&
                    provider.showDropdownError
                ? Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'you must choose your language.',
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : Container(),

            Container(
              width: size.width * .6,
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
                    ),
                  ],
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) => Container(
                      color: Colors.white70,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  provider.takeImage('camera');
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.camera,
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  provider.takeImage('gallery');
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.photo,
                                  size: 40,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            //show uploaded image
            provider.img != null
                ? Container(
                    padding: EdgeInsets.all(10),
                    child: kIsWeb
                        ? Image.network(provider.img!.path)
                        : Image.file(
                            File(provider.img!.path),
                          ),
                    height: 150,
                    width: 150,
                  )
                : Container(),

            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.submitReg,
                style: cbuttonStyle,
                child: cbuttonTextStyle('sign up'),
              ),
            ),
            Container(
              child: Text(
                provider.error,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            //SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
