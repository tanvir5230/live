import 'package:flutter/material.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:provider/provider.dart';

class InfoHeader extends StatelessWidget {
  const InfoHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CompanyInfoProvider>(
      builder: (context, provider, child) {
        return Container(
          height: MediaQuery.of(context).size.width > 1024 ? 110 : 80,
          child: Column(
            children: [
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
        );
      },
    );
  }
}
