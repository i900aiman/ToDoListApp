import 'package:flutter/material.dart';
import 'package:to_do_list_app/Home/Addpage.dart';

import 'Home/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      routes: {
        '/home': (context) => Homepage(),
        '/addPage': (context) => AddPage()
      },
      home: Homepage(),
    );
  }
}
