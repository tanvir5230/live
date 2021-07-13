import 'package:flutter/material.dart';

Widget filterSection(
    bool countryEnabled,
    Function changeCountryName,
    Function cancelCountryFilter,
    bool cityEnabled,
    Function changeCityName,
    Function cancelCityFilter,
    bool developerEnabled,
    Function changeDeveloperName,
    Function cancelDeveloperFilter,
    bool agentEnabled,
    Function changeAgentName,
    Function cancelAgentFilter,
    bool agenciesEnabled,
    Function changeAgenciesName,
    Function cancelAgenciesFilter,
    Map dropDownMap) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          {'name': 'country', 'enabled': countryEnabled, 'color': 0xFF3b529e},
          {'name': 'city', 'enabled': cityEnabled, 'color': 0xFFfc8081},
          {
            'name': 'developers',
            'enabled': developerEnabled,
            'color': 0xFF91b976
          },
          {'name': 'agent', 'enabled': agentEnabled, 'color': 0xFF8a8a8a},
          {'name': 'agencies', 'enabled': agenciesEnabled, 'color': 0xFF8a8a8a}
        ].map((item) {
          int color = int.parse(item['color'].toString());
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(right: 12),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color(color),
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  spreadRadius: 1)
            ], color: Color(color), borderRadius: BorderRadius.circular(10)),
            child: PopupMenuButton(
              onSelected: (value) {
                switch (item['name'].toString().toLowerCase()) {
                  case 'country':
                    changeCountryName(value);
                    break;
                  case 'city':
                    changeCityName(value);
                    break;
                  case 'developers':
                    changeDeveloperName(value);
                    break;
                  case 'agent':
                    changeAgentName(value);
                    break;
                  case 'agencies':
                    changeAgenciesName(value);
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
                            switch (item['name'].toString().toLowerCase()) {
                              case 'country':
                                cancelCountryFilter();
                                break;
                              case 'city':
                                cancelCityFilter();
                                break;
                              case 'developers':
                                cancelDeveloperFilter();
                                break;
                              case 'agent':
                                cancelAgentFilter();
                                break;
                              case 'agencies':
                                cancelAgenciesFilter();
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
                    return dropDownMap['countries']
                        .map<PopupMenuItem>((item) => PopupMenuItem<String>(
                              child: Text(item),
                              value: item,
                            ))
                        .toList();
                  case 'city':
                    return dropDownMap['cities']
                        .map<PopupMenuItem>((item) => PopupMenuItem<String>(
                              child: Text(item),
                              value: item,
                            ))
                        .toList();
                  case 'developers':
                    return dropDownMap['developers']
                        .map<PopupMenuItem>((item) => PopupMenuItem<String>(
                              child: Text(item),
                              value: item,
                            ))
                        .toList();
                  case 'agent':
                    return dropDownMap['agents']
                        .map<PopupMenuItem>((item) => PopupMenuItem<String>(
                              child: Text(item),
                              value: item,
                            ))
                        .toList();
                  case 'agencies':
                    return dropDownMap['agencies']
                        .map<PopupMenuItem>((item) => PopupMenuItem<String>(
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
}
