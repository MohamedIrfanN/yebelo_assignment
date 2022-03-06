import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yebelo/Screens/allproducts.dart';
import 'package:yebelo/Constants/dotindicator.dart';
import 'package:yebelo/Screens/premium.dart';
import 'package:yebelo/Screens/tamilnadu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,

          backgroundColor: Colors.green[800],
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black26,
            indicatorColor: Colors.black,
            indicator: DotIndicator(),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Premium'),
              Tab(text: 'Tamil Nadu'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllProducts(),
            Premium(),
            TamilNadu(),

          ],
        ),

      ),
    );
  }
}

