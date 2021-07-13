import 'package:flutter/material.dart';

Widget searchBox(brandSearch) {
  return SizedBox(
    height: 40,
    child: TextField(
      onChanged: (value) => brandSearch(value),
      decoration: new InputDecoration(
          hintText: 'search with brand name',
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.redAccent),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          suffixIcon: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade900),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.mic_none_outlined),
              iconSize: 25,
              color: Colors.white,
            ),
          )),
    ),
  );
}
