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
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            height: provider.sizeController,
            child: Column(
              children: [
                logoHeader(),
                SizedBox(
                  width: 170,
                  child: Column(
                    children: <Widget>[
                      Text(
                        provider.selectedCompany.toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 4,
                      ),
                      provider.selectedProject == null
                          ? Text('')
                          : Text(
                              provider.selectedProject.toString().toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
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
    padding: EdgeInsets.symmetric(horizontal: 30),
    alignment: Alignment.center,
    height: 130,
    width: 180,
    decoration: BoxDecoration(color: Colors.white.withOpacity(.4)),
    child: Image(
      image: AssetImage('assets/images/app_logo_dark_large.png'),
    ),
  );
}
