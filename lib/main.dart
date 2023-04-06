import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:httpapp/home.dart';
import 'package:httpapp/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HTTP flutter',
      theme: ThemeData(
        
        primarySwatch: Colors.indigo,
      ),
      home: GetData(),
    );
  }
}

