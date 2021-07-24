import 'package:flutter/cupertino.dart';
import 'package:live/propertyFactSheet/FactSheetButton.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:provider/provider.dart';

Widget factSheetLeft() {
  return Flexible(
    flex: 35,
    child: Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        var factsheet = provider.factSheetOfProperty == null
            ? provider.factsheetOfProject
            : provider.factSheetOfProperty;
        return ListView.builder(
          itemCount: (factsheet!.keys.length / 2).floor(),
          itemBuilder: (context, index) {
            return factSheetButtonLeft(
              factsheet.keys.toList()[index],
              factsheet.values.toList()[index],
            );
          },
        );
      },
    ),
  );
}

Widget factSheetRight() {
  return Flexible(
    flex: 35,
    child: Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        var factsheet = provider.factSheetOfProperty == null
            ? provider.factsheetOfProject
            : provider.factSheetOfProperty;

        return ListView.builder(
          itemCount: (factsheet!.keys.length / 2).round(),
          itemBuilder: (context, index) {
            return factSheetButtonRight(
              factsheet.keys.toList()[(factsheet.length / 2).floor() + index],
              factsheet.values.toList()[(factsheet.length / 2).floor() + index],
            );
          },
        );
      },
    ),
  );
}
