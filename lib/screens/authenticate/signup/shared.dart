import 'package:flutter/material.dart';
import 'package:live/metadata.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthHeaderForPC extends StatelessWidget {
  const AuthHeaderForPC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: 100,
              height: 50,
              child: Image.asset('assets/images/app_logo_white_large.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                TextButton(
                  child: Text(
                    'contact us'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    launchURL('mailto:${links['contactus']}');
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                TextButton(
                  child: Text(
                    'about us'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    launchURL('${links['aboutus']}');
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void launchURL(_url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
