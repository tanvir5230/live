import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/services/authenticationService.dart';

Widget signOutButton(BuildContext context) {
  return Container(
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
  );
}
