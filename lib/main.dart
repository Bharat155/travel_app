import 'package:flutter/material.dart';
import 'package:travel_app/views/categories/categories.dart';
import 'package:travel_app/views/header/header.dart';
import 'package:travel_app/views/packages/packages.dart';
import 'package:travel_app/views/popular_packages/popular_packages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Header(),
              const Categories(),
              const Packages(),
              PopularPackages(),
            ],
          ),
        ),
      ),
    );
  }
}
