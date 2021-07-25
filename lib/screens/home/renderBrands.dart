import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live/provider/companyInfoProvider.dart';
import 'package:live/screens/infoPage/infoPage.dart';
import 'package:provider/provider.dart';

class RenderBrands extends StatefulWidget {
  final String searchedBrandName;
  final String selectedCountry;
  final bool coutryFilterEnabled;
  final String selectedCity;
  final bool cityFilterEnabled;
  final String selectedDeveloper;
  final bool developerFilterEnabled;
  final String selectedAgent;
  final bool agentFilterEnabled;
  final String selectedAgency;
  final bool agencyFilterEnabled;
  final Function loadDropDownItems;

  const RenderBrands(
    this.searchedBrandName,
    this.selectedCountry,
    this.coutryFilterEnabled,
    this.selectedCity,
    this.cityFilterEnabled,
    this.selectedDeveloper,
    this.developerFilterEnabled,
    this.selectedAgent,
    this.agentFilterEnabled,
    this.selectedAgency,
    this.agencyFilterEnabled,
    this.loadDropDownItems,
  );

  @override
  _RenderBrandsState createState() => _RenderBrandsState();
}

class _RenderBrandsState extends State<RenderBrands> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height - 163,
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('companies').get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              List companies = snapshot.data!.docs;

              List getFilteredList(companyList) {
                return companyList
                    .where((element) => element['brandName']
                        .toString()
                        .contains(widget.searchedBrandName))
                    .toList();
              }

              void filterByCountry(List companyList) {
                List filteredBrandByCountry = companies
                    .where((element) =>
                        element['country'].toString().toLowerCase() ==
                        widget.selectedCountry.toLowerCase())
                    .toList();
                companies = filteredBrandByCountry;
              }

              void filterByCity(List companyList) {
                List filteredBrandByCity = companies
                    .where((element) =>
                        element['city'].toString().toLowerCase() ==
                        widget.selectedCity.toLowerCase())
                    .toList();
                companies = filteredBrandByCity;
              }

              void filterBydevelopers(List companyList) {
                List filteredBrandByDevelopers = companies
                    .where((element) =>
                        element['developer'].toString().toLowerCase() ==
                        widget.selectedDeveloper.toLowerCase())
                    .toList();
                companies = filteredBrandByDevelopers;
              }

              void filterByAgent(List companyList) {
                List filteredBrandByAgent = companies
                    .where((element) =>
                        element['agent'].toString().toLowerCase() ==
                        widget.selectedAgent.toLowerCase())
                    .toList();
                companies = filteredBrandByAgent;
              }

              void filterByAgencies(List companyList) {
                List filteredBrandByAgencies = companies
                    .where((element) =>
                        element['agency'].toString().toLowerCase() ==
                        widget.selectedAgency.toLowerCase())
                    .toList();
                companies = filteredBrandByAgencies;
              }

              if (widget.coutryFilterEnabled) filterByCountry(companies);
              if (widget.cityFilterEnabled) filterByCity(companies);
              if (widget.developerFilterEnabled) filterBydevelopers(companies);
              if (widget.agentFilterEnabled) filterByAgent(companies);
              if (widget.agencyFilterEnabled) filterByAgencies(companies);

              return ListView.builder(
                  itemCount: getFilteredList(companies).length > 0
                      ? getFilteredList(companies).length
                      : 1,
                  itemBuilder: (BuildContext context, index) {
                    final List filteredBrandNames =
                        getFilteredList(companies).toList();
                    return filteredBrandNames.length > 0
                        ? renderBrandList(filteredBrandNames, index)
                        : Center(
                            child: Text('nothing found.',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          );
                  });
            } else {
              return Text('error');
            }
          },
        ),
      ),
    );
  }
}

Widget renderBrandList(List companies, int index) {
  return ChangeNotifierProvider<CompanyInfoProvider>(
    create: (context) => CompanyInfoProvider(),
    child: Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Center(
        child: Consumer<CompanyInfoProvider>(
          builder: (context, provider, child) {
            return ListTile(
              onTap: () {
                provider.setSelectedCompanyName = companies[index]['brandName'];
                provider.setSelectedCompanyProjectList =
                    companies[index]['project'];
                var companyName = provider.selectedCompany;
                var companyList = provider.companyProjectList;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      body: ChangeNotifierProvider<CompanyInfoProvider>(
                        create: (context) => CompanyInfoProvider(),
                        child: InfoPage(companyName!, companyList!),
                      ),
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(companies[index]['brandLogo']),
              ),
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(companies[index]['brandName']),
              ),
            );
          },
        ),
      ),
    ),
  );
}
