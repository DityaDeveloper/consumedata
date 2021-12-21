import 'package:flutter/material.dart';

import 'screen/user_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consume Data API',
      theme: ThemeData(
      
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}