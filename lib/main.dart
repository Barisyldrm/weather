import 'package:flutter/material.dart';

import 'weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: HomePage2(),
    );
  }
}

PreferredSizeWidget? metod() {
  return AppBar(
    title: Text(
      "WEATHER",
      style: TextStyle(
        color: Colors.amber,
        fontSize: 40,
      ),
    ),
    elevation: 25.0,
    shadowColor: Colors.amber, //gölge
    backgroundColor: Colors.black87, //bar rengi
    centerTitle: true,
    toolbarOpacity: 0.8,
    actions:<Widget> [Icon(Icons.local_fire_department_outlined,color: Colors.amber,)],
  );
}
