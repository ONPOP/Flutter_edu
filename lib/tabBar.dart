import 'package:flutter/material.dart';
import 'sub/firstPage.dart';
import 'sub/secondPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 165, 145, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomepage()
    );
  }
}

class MyHomepage extends StatefulWidget {

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
      ),
      body: TabBarView(
        children: <Widget>[FirstApp(), SeconddApp()],
        controller: controller,
        ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue,),),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue,),),
        ], controller: controller,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

}
