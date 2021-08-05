import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live/services/authenticationService.dart';
import 'package:live/services/firestoreService.dart';
import 'package:live/shared/constants.dart';

class ChangePhoneWidget extends StatefulWidget {
  final Function popWidget;
  const ChangePhoneWidget({Key? key, required this.popWidget})
      : super(key: key);

  @override
  _ChangePhoneWidgetState createState() => _ChangePhoneWidgetState();
}

class _ChangePhoneWidgetState extends State<ChangePhoneWidget> {
  String error = '';
  String phoneNo = '';
  String countryCode = '+974';
  bool loading = false;

  void changeLoading() {
    setState(() {
      loading = !loading;
    });
  }

  void changePhone(String phone) {
    setState(() {
      phoneNo = phone;
    });
  }

  void changeCountryCode(String code) {
    setState(() {
      countryCode = code;
    });
  }

  void changeError(String err) {
    setState(() {
      error = err;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(cborderRadius)),
                border: Border.all(color: Colors.white70, width: 2.0),
              ),
              child: Column(
                children: [
                  IntlPhoneField(
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
                      changePhone(phone.number.toString());
                    },
                    onCountryChanged: (phone) {
                      changeCountryCode(phone.countryCode.toString());
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red.shade900,
                        ),
                        child: Text('change your phone no'),
                        onPressed: () async {
                          if (phoneNo.length != 0) {
                            changeLoading();
                            Map<String, dynamic> result =
                                await FirestoreService().changePhone(
                                    AuthService().getCurrentUser()!.uid,
                                    '${countryCode + phoneNo}');
                            if (result['success']) {
                              widget.popWidget();
                            } else {
                              changeLoading();
                              changeError(result['error']);
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  Text(
                    error.toUpperCase(),
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          );
  }
}
