import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/propertyFactSheet/factSheetDataContainer.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/infoHeader.dart';
import 'package:live/screens/infoPage/menuContainer.dart';
import 'package:provider/provider.dart';

class PropertyFactSheet extends StatelessWidget {
  const PropertyFactSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        logoHeader(),
        propertyHeading(),
        propertyData(),
        propertyButton(),
      ],
    );
  }
}

Widget propertyHeading() {
  return SizedBox(
    height: 100,
    width: 180,
    child: Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Text(
              provider.selectedProject.toString().toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            Divider(
              color: Colors.white,
              thickness: 4,
            ),
            Text(
              'factsheet of ${provider.selectedProperty.toString().toUpperCase()}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    ),
  );
}

Widget propertyData() {
  return Consumer<CompanyInfoProvider>(
    builder: (context, provider, child) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          manInTheMiddle(),
          Consumer<CompanyInfoProvider>(
            builder: (context, provider, child) {
              return Container(
                //color: Colors.red,
                width: double.infinity,
                height: MediaQuery.of(context).size.height -
                    (provider.sizeController + provider.sizeController / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    factSheetLeft(),
                    Flexible(
                      flex: 30,
                      child: Container(),
                    ),
                    factSheetRight(),
                  ],
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

Widget propertyButton() {
  return Consumer<CompanyInfoProvider>(
    builder: (context, provider, child) {
      return ElevatedButton(
        onPressed: () {
          provider.changePropertyFactSheetShow();
        },
        child: SizedBox(
          width: 200,
          height: 50,
          child: Row(
            children: [Icon(Icons.arrow_left), Text('Return to properties')],
          ),
        ),
      );
    },
  );
}
