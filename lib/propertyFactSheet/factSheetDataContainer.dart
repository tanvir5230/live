import 'package:flutter/cupertino.dart';
import 'package:live/propertyFactSheet/FactSheetButton.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:provider/provider.dart';

Widget factSheetLeft() {
  return Flexible(
    flex: 35,
    child: Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        print(provider.factSheetOfProperty);
        return ListView.builder(
          itemCount: (provider.factSheetOfProperty!.keys.length / 2).floor(),
          itemBuilder: (context, index) {
            return factSheetButtonLeft(
              provider.factSheetOfProperty!.keys.toList()[index],
              provider.factSheetOfProperty!.values.toList()[index],
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
      builder: (context, provider, child) => ListView.builder(
        itemCount: (provider.factSheetOfProperty!.keys.length / 2).round(),
        itemBuilder: (context, index) {
          return factSheetButtonRight(
            provider.factSheetOfProperty!.keys.toList()[
                (provider.factSheetOfProperty!.length / 2).floor() + index],
            provider.factSheetOfProperty!.values.toList()[
                (provider.factSheetOfProperty!.length / 2).floor() + index],
          );
        },
      ),
    ),
  );
}
