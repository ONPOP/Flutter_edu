import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MaterialFlutterApp(),
    );
  }
}

class MaterialFlutterApp extends StatefulWidget {

  @override
  _MaterialFlutterAppState createState() => _MaterialFlutterAppState();
}

class _MaterialFlutterAppState extends State<MaterialFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center( // Center는 가로로만 정렬!!! 
          child: Column(
            children: <Widget>[
              Icon(Icons.android),
              Text('android'),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            // ===> 세로 가운데 정렬 mainAxisAlignment : MainAxisAlignment.center
          ),
        ) 
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 165, 145, 1),
        title: Text('Material Design App'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    ); //Scaffold
  } //'build' override
} 
