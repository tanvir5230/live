import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live/propertyFactSheet/factSheetDataContainer.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/menuContainer.dart';
import 'package:provider/provider.dart';

class ProjectFactSheet extends StatelessWidget {
  const ProjectFactSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        projectHeading(context),
        projectData(),
        projectButton(),
      ],
    );
  }
}

Widget projectHeading(context) {
  return SizedBox(
    width: 180,
    child: Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Text(
                provider.selectedCompany.toString().toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      Provider.of<CompanyInfoProvider>(context).headingFontsize,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              Divider(
                color: Colors.white,
                thickness: 4,
              ),
              Text(
                'factsheet of ${provider.selectedProject}'
                    .toString()
                    .toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      Provider.of<CompanyInfoProvider>(context).headingFontsize,
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

Widget projectData() {
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
                margin: EdgeInsets.only(top: 10),
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

Widget projectButton() {
  return Consumer<CompanyInfoProvider>(
    builder: (context, provider, child) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.red.shade900,
        ),
        onPressed: () {
          provider.changeProjectFSViewStatus();
        },
        child: SizedBox(
          width: 200,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.arrow_left), Text('Return to projects')],
          ),
        ),
      );
    },
  );
}
