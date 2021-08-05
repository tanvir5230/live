import 'package:flutter/material.dart';
import 'package:live/metadata.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:share/share.dart';

Widget rateAppIos() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
      ),
      onPressed: () {
        launchURL(links['ios']);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.star), Text('Rate the app')],
      ),
    ),
  );
}

Widget rateAppAndroid() {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey,
      ),
      onPressed: () {
        launchURL(links['android']);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.star), Text('Rate the app')],
      ),
    ),
  );
}

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
