import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live/metadata.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:live/screens/home/homeDrawerContent/adminBtn.dart';
import 'package:live/screens/home/homeDrawerContent/changeLang.dart';
import 'package:live/screens/home/homeDrawerContent/changePhone.dart';
import 'package:live/screens/home/homeDrawerContent/rateApp.dart';
import 'package:live/screens/home/homeDrawerContent/signOutBtn.dart';
import 'package:live/screens/infoPage/footer.dart';
import 'package:live/services/authenticationService.dart';
import 'package:live/services/firestoreService.dart';
import 'package:live/shared/constants.dart';
import 'dart:io' show Platform;

class HomeDrawerContent extends StatefulWidget {
  const HomeDrawerContent({Key? key}) : super(key: key);

  @override
  _HomeDrawerContentState createState() => _HomeDrawerContentState();
}

class _HomeDrawerContentState extends State<HomeDrawerContent> {
  bool showLangChangeWidget = false;
  bool showPhoneChangeWidget = false;

  void showHideLangWidget() {
    setState(() {
      showLangChangeWidget = !showLangChangeWidget;
    });
  }

  void showHidePhoneWidget() {
    setState(() {
      showPhoneChangeWidget = !showPhoneChangeWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirestoreService().user(AuthService().getCurrentUser()!.uid),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final user = snapshot.data!.data() as Map;
          return Container(
            height: size.height,
            color: Color(formBgColor),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //######### user name and image container ######//
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.shade400,
                          Colors.red.shade900,
                        ],
                      ),
                    ),
                    child: userNameImage(user),
                  ),
                  //######### user name and image container ######//

                  //#### this container contains language, phone , divider ####//
                  Container(
                    height: showLangChangeWidget || showPhoneChangeWidget
                        ? null
                        : 150,
                    child: Column(
                      children: [
                        //######### user language container ######//
                        userLangWidget(
                          user: user,
                          showWidget: showLangChangeWidget,
                          changeWidgetView: showHideLangWidget,
                        ),
                        //######### user language container ######//

                        SizedBox(
                          height: 10,
                        ),

                        //######### user phone no container ######//
                        userPhoneWidget(
                          user: user,
                          showWidget: showPhoneChangeWidget,
                          changeWidgetView: showHidePhoneWidget,
                        ),
                        //######### user phone no container ######//

                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  ),
                  //#### this container contains language, phone , divider ####//,

                  Container(
                    height: size.height <= 568 ? null : size.height - 400,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: kIsWeb
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.center,
                      children: [
                        !kIsWeb
                            ? SizedBox(
                                height: 30,
                              )
                            : SizedBox(),

                        //#### social buttons #####//
                        kIsWeb
                            ? Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                child: socialButtons(),
                              )
                            : Container(),
                        //#### social buttons #####//

                        //######### about us ######//
                        aboutUsButton(),
                        //######### about us ######//

                        SizedBox(
                          height: 10,
                        ),

                        //######### contact us ######//
                        contactUsButton(),
                        //######### contact us ######//

                        //######### share app ######//
                        shareAppButton(),
                        //######### share app ######//

                        //######### rate app ######//
                        !kIsWeb
                            ? Platform.isIOS
                                ? rateAppIos()
                                : Container()
                            : Container(),
                        !kIsWeb
                            ? Platform.isAndroid
                                ? rateAppAndroid()
                                : Container()
                            : Container(),
                        //######### rate app ######//
                        //########### sign out button ##############//
                        SizedBox(
                          height: 12,
                        ),

                        signOutButton(context),
                        //########### sign out button ##############//

                        //########### admin button ##############//
                        adminButton(user),
                        //########### admin button ##############//
                      ],
                    ),
                  ),
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

Widget userNameImage(Map user) {
  return Center(
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
                  backgroundImage: NetworkImage(user['photoUrl']),
                )
              : CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/images/head.png'),
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
  );
}

Widget userLangWidget({
  required Map user,
  required bool showWidget,
  required Function changeWidgetView,
}) {
  return Column(
    children: [
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
            changeWidgetView();
          },
        ),
      ),
      showWidget
          ? Column(
              children: [
                ChangeLanguageWidget(
                  popWidget: changeWidgetView,
                ),
                IconButton(
                  onPressed: () {
                    changeWidgetView();
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red.shade900,
                  ),
                ),
              ],
            )
          : Container(),
    ],
  );
}

Widget userPhoneWidget({
  required Map user,
  required bool showWidget,
  required Function changeWidgetView,
}) {
  return Column(
    children: [
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
            changeWidgetView();
          },
        ),
      ),
      SizedBox(
        height: 20,
      ),
      showWidget
          ? Column(
              children: [
                ChangePhoneWidget(
                  popWidget: changeWidgetView,
                ),
                IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red.shade900,
                  ),
                  onPressed: () {
                    changeWidgetView();
                  },
                ),
              ],
            )
          : Container(),
    ],
  );
}

Widget aboutUsButton() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: ElevatedButton(
      child: Text(
        'about us'.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        launchURL('${links['aboutus']}');
      },
    ),
  );
}

Widget contactUsButton() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: ElevatedButton(
      child: Text(
        'contact us'.toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        launchURL('mailto:${links['contactus']}');
      },
    ),
  );
}

Widget shareAppButton() {
  return !kIsWeb
      ? Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      : Container();
}
