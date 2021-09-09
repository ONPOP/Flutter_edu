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
      home: ImageWidgetApp(),
    );
  }
}

class ImageWidgetApp extends StatefulWidget {
  @override
  _ImageWidgetAppState createState() => _ImageWidgetAppState();
}

class _ImageWidgetAppState extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Widget Logo'),),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('image/flutter_logo.png', 
              width: 200, height: 100, fit: BoxFit.fitHeight,),
              Text('ON POPS',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Color.fromRGBO(0, 165, 145, 1),
                  ),
              )
            ]
          ),
        ),
      ),
    );
  }
}