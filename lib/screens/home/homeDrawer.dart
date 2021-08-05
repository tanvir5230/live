import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live/metadata.dart';
import 'package:live/screens/authenticate/Languages.dart';
import 'package:live/services/authenticationService.dart';
import 'package:live/services/firestoreService.dart';
import 'package:live/shared/constants.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class HomeDrawerContent extends StatefulWidget {
  const HomeDrawerContent({Key? key}) : super(key: key);

  @override
  _HomeDrawerContentState createState() => _HomeDrawerContentState();
}

class _HomeDrawerContentState extends State<HomeDrawerContent> {
  bool showLangChangeWidget = false;
  bool showPhoneChangeWidget = false;

  void hideLangWidget() {
    setState(() {
      showLangChangeWidget = false;
    });
  }

  void hidePhoneWidget() {
    setState(() {
      showPhoneChangeWidget = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreService().user(AuthService().getCurrentUser()!.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data!.data() as Map;
          return SingleChildScrollView(
            child: Container(
              color: Color(formBgColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.shade400,
                          Colors.red.shade900,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: user['photoUrl'].toString().length > 0
                                ? CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        NetworkImage(user['photoUrl']),
                                  )
                                : CircleAvatar(
                                    radius: 30.0,
                                    backgroundColor: Colors.black,
                                    backgroundImage:
                                        AssetImage('assets/images/head.png'),
                                  ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            user['name'].toString().toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 8),
                          leading: Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          title: Text(
                            'language: ${user['language']}',
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                showLangChangeWidget = !showLangChangeWidget;
                              });
                            },
                          ),
                        ),
                        showLangChangeWidget
                            ? Column(
                                children: [
                                  ChangeLanguageWidget(
                                    popWidget: hideLangWidget,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showLangChangeWidget = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.only(left: 8),
                          title: Text(
                            'phone no: ${user["phone_number"]}',
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit_rounded,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              setState(() {
                                showPhoneChangeWidget = !showPhoneChangeWidget;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        showPhoneChangeWidget
                            ? Column(
                                children: [
                                  ChangePhoneWidget(
                                    popWidget: hidePhoneWidget,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showPhoneChangeWidget = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                            child: Text(
                              'about us'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _launchURL('${links['aboutus']}');
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: ElevatedButton(
                            child: Text(
                              'contact us'.toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _launchURL('mailto:${links['contactus']}');
                            },
                          ),
                        ),
                        !kIsWeb
                            ? Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    shareApp('android',
                                        'https://play.google.com/store/apps/details?id=com.atradar.atradar'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    shareApp('ios',
                                        'https://play.google.com/store/apps/details?id=com.atradar.atradar'),
                                  ],
                                ),
                              )
                            : Container(),
                        Platform.isIOS
                            ? ElevatedButton(
                                onPressed: null,
                                child: Row(
                                  children: [
                                    Icon(Icons.rate_review),
                                    Text('Rate the app')
                                  ],
                                ),
                              )
                            : Container(),
                        Platform.isAndroid
                            ? Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                  ),
                                  onPressed: () {
                                    _launchURL(
                                        'https://play.google.com/store/apps/details?id=com.atradar.atradar');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star),
                                      Text('Rate the app')
                                    ],
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),

                  //########### sign out button ##############//
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red.shade900,
                      ),
                      onPressed: () async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: CupertinoAlertDialog(
                                title: Text(
                                  "Logout",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                content: Text('Are you sure to log out?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      AuthService().signOut();
                                      Navigator.pop(context);
                                    },
                                    child: Text('confirm'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Text('sign out'),
                    ),
                  ),
                  //########### sign out button ##############//

                  //########### admin button ##############//
                  user['user_type'] == 'admin'
                      ? ElevatedButton(
                          onPressed: () {},
                          child: Text('admin panel'),
                        )
                      : Text(''),
                  //########### admin button ##############//
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

void _launchURL(_url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

Widget shareApp(String appName, String link) {
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
      ),
      onPressed: () {
        Share.share('$link', subject: '$appName');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.share,
            size: 14,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            appName,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}

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

class ChangePhoneWidget extends StatefulWidget {
  final Function popWidget;
  const ChangePhoneWidget({Key? key, required this.popWidget})
      : super(key: key);

  @override
  _ChangePhoneWidgetState createState() => _ChangePhoneWidgetState();
}

class _ChangePhoneWidgetState extends State<ChangePhoneWidget> {
  bool loading = false;
  String error = '';
  String phoneNo = '';
  String countryCode = '+974';

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
    return Padding(
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
                      setState(() {
                        loading = true;
                      });
                      Map<String, dynamic> result = await FirestoreService()
                          .changePhone(AuthService().getCurrentUser()!.uid,
                              '${countryCode + phoneNo}');
                      result['success']
                          ? widget.popWidget()
                          : changeError(result['error']);
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
