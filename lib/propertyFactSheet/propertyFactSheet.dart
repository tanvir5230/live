import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/propertyFactSheet/factSheetDataContainer.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/menuContainer.dart';
import 'package:provider/provider.dart';

class PropertyFactSheet extends StatelessWidget {
  const PropertyFactSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        propertyHeading(),
        propertyData(),
        propertyButton(),
      ],
    );
  }
}

Widget propertyHeading() {
  return SizedBox(
    width: 180,
    child: Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Text(
                provider.selectedProject.toString().toUpperCase(),
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
              Text(
                'factsheet of ${provider.selectedProperty.toString().toUpperCase()}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
          Positioned(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: manInTheMiddle(),
            ),
          ),
          Consumer<CompanyInfoProvider>(
            builder: (context, provider, child) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
        style: ElevatedButton.styleFrom(
          primary: Colors.red.shade900,
        ),
        onPressed: () {
          provider.changePropertyFactSheetShow();
        },
        child: SizedBox(
          width: 200,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.arrow_left), Text('Return to properties')],
          ),
        ),
      );
    },
  );
}