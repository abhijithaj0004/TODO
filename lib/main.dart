import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/home_screen.dart';

void main(List<String> args) async {
  //init hive
  await Hive.initFlutter();
  final box = await Hive.openBox('mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomeScreen(),
    );
  }
}
