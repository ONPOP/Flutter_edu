
import 'package:flutter/material.dart';
// iphone 전용은 cupertino.dart !!


// 중요 쟁점 => StatefulWidget (createState, initState, setState) / ElevatedButton
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var switchValue = false;
  String test = 'hello';
  Color _color = Colors.lightGreen;

  @override
  Widget build(BuildContext context) {
    print('build');
    return MaterialApp(
      title: 'ONPOP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Hompage'),
          ),

        body: Center(
          child: ElevatedButton(
            child: Text('$test'),
            style: ElevatedButton.styleFrom(
              primary: _color,
            ),
            onPressed: (){
              if (test == 'hello'){
                setState(() {
                  test = 'flutter';
                _color = Colors.purple;
                });
              } else {
                setState(() {
                  test = 'hello';
                _color = Colors.lightGreen;
                });
              }
            },
          ) 
        )
      )  
    );
  } // State.build

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('idChangeDependencies');
  }
  

}