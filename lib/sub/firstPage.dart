import 'package:flutter/material.dart';

class FirstApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('First Page', 
        style: TextStyle(fontSize: 30, color: Colors.amber, fontWeight: FontWeight.bold,)
        ),

    );
  }
}