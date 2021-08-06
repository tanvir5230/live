import 'package:flutter/material.dart';
import 'package:live/metadata.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/authenticate/signup/shared.dart';
import 'package:provider/provider.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool hideFooter = false;
  void showOrHide() {
    setState(() {
      hideFooter = !hideFooter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: hideFooter ? null : Colors.black.withOpacity(.5),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 100,
      child: hideFooter
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    child: Text('show'),
                    onPressed: showOrHide,
                  ),
                ),
              ],
            )
          : Row(
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
                  child: rightButtons(showOrHide),
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
        onPressed: () {
          launchURL(links['facebook']);
        },
        icon: Image.asset('assets/images/facebook.png'),
      ),
      IconButton(
        onPressed: () {
          launchURL(links['linkedin']);
        },
        icon: Image.asset('assets/images/linkedin.png'),
      ),
      IconButton(
        onPressed: () {
          launchURL(links['twitter']);
        },
        icon: Image.asset('assets/images/twitter.png'),
      ),
      IconButton(
        onPressed: () {
          launchURL(links['instagram']);
        },
        icon: Image.asset('assets/images/instagram.png'),
      ),
    ],
  );
}

Widget rightButtons(Function hideFooter) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      cDivider(),
      CtextButton('reset'),
      cDivider(),
      CtextButton('hide', hideFooter),
      cDivider(),
    ],
  );
}

class CtextButton extends StatelessWidget {
  final String text;
  final Function? showOrHide;
  const CtextButton(this.text, [this.showOrHide]);

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
            if (text == 'hide') {
              showOrHide!();
            }
            if (text == 'scale') {
              showBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.black87,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            provider.scaleDefault();
                            Navigator.pop(context);
                          },
                          child: Text('Scale 1x'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            provider.scaleDouble();
                            Navigator.pop(context);
                          },
                          child: Text('Scale 2x'),
                        ),
                      ],
                    ),
                  );
                },
              );
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
              fontWeight: FontWeight.bold,
            ),
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
