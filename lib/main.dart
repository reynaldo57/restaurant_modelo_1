import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'restaurant-1',
      home: HomePage(),

    );
  }
}

