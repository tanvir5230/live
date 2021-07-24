import 'package:flutter/material.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:provider/provider.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        return Center(
          child: Container(
            //color: Colors.red,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            height: 160,
            child: Column(
              children: [
                logoHeader(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 180,
                  child: Column(
                    children: <Widget>[
                      Text(
                        provider.selectedCompany.toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: provider.headingFontsize,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      provider.selectedProject == null
                          ? Text('')
                          : Text(
                              provider.selectedProject.toString().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: provider.headingFontsize,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget logoHeader() {
  return Container(
    alignment: Alignment.center,
    height: 90,
    width: 180,
    decoration: BoxDecoration(color: Colors.white.withOpacity(.4)),
    child: Image(
      image: AssetImage('assets/images/app_logo_dark_large.png'),
    ),
  );
}
