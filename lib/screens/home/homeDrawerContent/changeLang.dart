import 'package:flutter/material.dart';
import 'package:live/screens/authenticate/Languages.dart';
import 'package:live/services/authenticationService.dart';
import 'package:live/services/firestoreService.dart';
import 'package:live/shared/constants.dart';

class ChangeLanguageWidget extends StatefulWidget {
  final Function popWidget;
  const ChangeLanguageWidget({Key? key, required this.popWidget})
      : super(key: key);
  @override
  _ChangeLanguageWidgetState createState() => _ChangeLanguageWidgetState();
}

class _ChangeLanguageWidgetState extends State<ChangeLanguageWidget> {
  dynamic currentSelectedLanguage;
  String error = '';
  bool loading = false;
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
        : Container(
            color: Color(formBgColor),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border:
                            Border.all(color: Color(cborderColor), width: 2.0)),
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
                            currentSelectedLanguage == null
                                ? 'Language'
                                : currentSelectedLanguage,
                            style: ctextInputFieldStyle,
                          ),
                        ],
                      ),
                      style: ctextInputFieldStyle,
                      value: currentSelectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          currentSelectedLanguage = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade900,
                      ),
                      onPressed: () async {
                        if (currentSelectedLanguage != null) {
                          Map<String, dynamic> result = await FirestoreService()
                              .changeLanguage(
                                  AuthService().getCurrentUser()!.uid,
                                  '$currentSelectedLanguage');
                          result['success']
                              ? widget.popWidget()
                              : changeError(result['error']);
                        }
                      },
                      child: Text('change the language'),
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
