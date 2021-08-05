import 'package:flutter/material.dart';

Widget adminButton(Map user) {
  return user['user_type'] == 'admin'
      ? ElevatedButton(
          onPressed: () {},
          child: Text('admin panel'),
        )
      : Text('');
}
