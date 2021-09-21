import 'package:flutter/material.dart';

import 'package:mobilefirst/index.dart';
import 'package:mobilefirst/screen/dashboard.dart';
import 'package:mobilefirst/screen/register.dart';

import 'config/constant.dart';
import 'screen/login.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMUTNB',
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
      ),
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
        'dashboard': (context) => Dashboard(),
      },
      home: Index(),
    );
  }
}
