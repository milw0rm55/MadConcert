import 'package:flutter/material.dart';
import 'package:mad_concert/Login/root_page.dart';
import 'package:mad_concert/Login/auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mad Concert',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new RootPage(auth: new Auth()),
    );

  }

}
