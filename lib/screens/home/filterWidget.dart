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
        Size size = MediaQuery.of(context).size;
        List itemList = [
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
            'color': 0xFFFFD54F
          },
          {
            'name': 'agencies',
            'enabled': provider.enabledAgenciesFilter,
            'color': 0xFF8a8a8a
          }
        ];
        return SingleChildScrollView(
          scrollDirection: size.width < 1000 ? Axis.horizontal : Axis.vertical,
          child: SizedBox(
            height: size.width < 1000 ? 50 : 400,
            child: size.width < 1000
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: itemList.map((item) {
                      int color = int.parse(item['color'].toString());
                      return filterTextContainer(provider, item, color, size);
                    }).toList(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: itemList.map((item) {
                      int color = int.parse(item['color'].toString());
                      return filterTextContainer(provider, item, color, size);
                    }).toList(),
                  ),
          ),
        );
      },
    );
  }
}

Widget filterTextContainer(provider, item, color, size) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    margin: size.width < 1000
        ? EdgeInsets.only(right: 12)
        : EdgeInsets.only(bottom: 12),
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          item['enabled'] == true
              ? IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    switch (item['name'].toString().toLowerCase()) {
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
                .map<PopupMenuItem>((item) => PopupMenuItem<String>(
                      child: Text(item),
                      value: item,
                    ))
                .toList();
          case 'city':
            return provider.allCities
                .toList()
                .map<PopupMenuItem>((item) => PopupMenuItem<String>(
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
                .map<PopupMenuItem>((item) => PopupMenuItem<String>(
                      child: Text(item),
                      value: item,
                    ))
                .toList();
          case 'agencies':
            return provider.allAgencies
                .toList()
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
}
