import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:provider/provider.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(
      builder: (context, provider, child) {
        if (provider.allCountries.length == 0) {
          provider.loadDropDownItems();
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                {
                  'name': 'country',
                  'enabled': provider.enabledCountryFilter,
                  'color': 0xFF3b529e
                },
                {
                  'name': 'city',
                  'enabled': provider.enabledCityFilter,
                  'color': 0xFFfc8081
                },
                {
                  'name': 'developers',
                  'enabled': provider.enabledDevelopersFilter,
                  'color': 0xFF91b976
                },
                {
                  'name': 'agent',
                  'enabled': provider.enabledAgentFilter,
                  'color': 0xFF8a8a8a
                },
                {
                  'name': 'agencies',
                  'enabled': provider.enabledAgenciesFilter,
                  'color': 0xFF8a8a8a
                }
              ].map((item) {
                int color = int.parse(item['color'].toString());
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color(color),
                            offset: Offset(0, 2),
                            blurRadius: 2,
                            spreadRadius: 1)
                      ],
                      color: Color(color),
                      borderRadius: BorderRadius.circular(10)),
                  child: PopupMenuButton(
                    onSelected: (value) {
                      switch (item['name'].toString().toLowerCase()) {
                        case 'country':
                          provider.countrySearch(value.toString());
                          break;
                        case 'city':
                          provider.citySearch(value.toString());
                          break;
                        case 'developers':
                          provider.developersSearch(value.toString());
                          break;
                        case 'agent':
                          provider.agentSearch(value.toString());
                          break;
                        case 'agencies':
                          provider.agenciesSearch(value.toString());
                          break;
                        default:
                      }
                    },
                    // onCanceled: () => {},
                    color: Colors.white,
                    iconSize: 0,
                    child: Row(
                      children: [
                        Text(
                          '${item['name']}',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        item['enabled'] == true
                            ? IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  switch (
                                      item['name'].toString().toLowerCase()) {
                                    case 'country':
                                      provider.cancelCountryFilter();
                                      break;
                                    case 'city':
                                      provider.cancelCityFilter();
                                      break;
                                    case 'developers':
                                      provider.cancelDevelopersFilter();
                                      break;
                                    case 'agent':
                                      provider.cancelAgentFilter();
                                      break;
                                    case 'agencies':
                                      provider.cancelAgenciesFilter();
                                      break;
                                    default:
                                  }
                                },
                                icon: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.white,
                                ),
                              )
                            : Text(''),
                      ],
                    ),
                    itemBuilder: (BuildContext context) {
                      switch (item['name'].toString().toLowerCase()) {
                        case 'country':
                          return provider.allCountries
                              .toList()
                              .map<PopupMenuItem>(
                                  (item) => PopupMenuItem<String>(
                                        child: Text(item),
                                        value: item,
                                      ))
                              .toList();
                        case 'city':
                          return provider.allCities
                              .toList()
                              .map<PopupMenuItem>(
                                  (item) => PopupMenuItem<String>(
                                        child: Text(item),
                                        value: item,
                                      ))
                              .toList();
                        case 'developers':
                          return provider.allDevelopers
                              .toList()
                              .map<PopupMenuItem>(
                                (item) => PopupMenuItem<String>(
                                  child: Text(item),
                                  value: item,
                                ),
                              )
                              .toList();
                        case 'agent':
                          return provider.allAgents
                              .toList()
                              .map<PopupMenuItem>(
                                  (item) => PopupMenuItem<String>(
                                        child: Text(item),
                                        value: item,
                                      ))
                              .toList();
                        case 'agencies':
                          return provider.allAgencies
                              .toList()
                              .map<PopupMenuItem>(
                                  (item) => PopupMenuItem<String>(
                                        child: Text(item),
                                        value: item,
                                      ))
                              .toList();
                        default:
                          return [];
                      }
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
