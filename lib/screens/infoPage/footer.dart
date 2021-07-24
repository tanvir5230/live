import 'package:flutter/material.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 2,
            child: leftButtons(),
          ),
          Flexible(
            flex: 6,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                socialButtons(),
                Positioned(
                  bottom: 40,
                  child: Icon(
                    Icons.qr_code_2_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: rightButtons(),
          ),
        ],
      ),
    );
  }
}

Widget leftButtons() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      cDivider(),
      CtextButton('scale'),
      cDivider(),
      CtextButton('back'),
      cDivider(),
    ],
  );
}

Widget socialButtons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/facebook.png'),
      ),
      IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/youtube.png'),
      ),
      IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/twitter.png'),
      ),
      IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/instagram.png'),
      ),
    ],
  );
}

Widget rightButtons() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      cDivider(),
      CtextButton('reset'),
      cDivider(),
      CtextButton('hide'),
      cDivider(),
    ],
  );
}

class CtextButton extends StatelessWidget {
  final String text;
  const CtextButton(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Consumer<CompanyInfoProvider>(
        builder: (context, provider, child) => TextButton(
          onPressed: () {
            if (text == 'back') {
              Navigator.pop(context);
            }
            if (text == 'reset') {
              provider.reset();
            }
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

Widget cDivider() {
  return SizedBox(
    width: 80,
    height: 0,
    child: Divider(
      thickness: 4,
      color: Colors.white,
    ),
  );
}
