import 'package:flutter/material.dart';
import 'package:live/provider/HomepageProvider.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomepageProvider>(
      builder: (context, provider, child) => Container(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: textField(context, provider),
              flex: 88,
            ),
            Expanded(
              child: micButton(context, provider),
              flex: 12,
            ),
          ],
        ),
      ),
    );
  }
}

Widget textField(BuildContext context, provider) {
  return Container(
    child: TextField(
      onChanged: (value) => provider.brandSearch(value),
      decoration: InputDecoration(
        hintText: 'search with brand name',
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
      ),
    ),
  );
}

Widget micButton(BuildContext context, HomepageProvider provider) {
  return Container(
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.blue.shade900),
    child: IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        provider.showOrHideVoiceWidget();
        provider.listen();
      },
      icon: Icon(Icons.mic_none_outlined),
      iconSize: 25,
      color: Colors.white,
    ),
  );
}
