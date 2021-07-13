import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                        element['country'].toString().toLowerCase() ==
                        widget.selectedCountry.toLowerCase())
                    .toList();
                companies = filteredBrandByCity;
              }

              if (widget.coutryFilterEnabled) filterByCountry(companies);
              if (widget.cityFilterEnabled) filterByCity(companies);

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
  return Container(
    height: 70,
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Center(
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: NetworkImage(companies[index]['brandLogo']),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(companies[index]['brandName']),
        ),
      ),
    ),
  );
}
