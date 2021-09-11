import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator', 
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalWidgetApp(),
    );
  }
}

class CalWidgetApp extends StatefulWidget {



  @override
  _CalWidgetAppState createState() => _CalWidgetAppState();
}

class _CalWidgetAppState extends State<CalWidgetApp> {
  String sum = ''; // String? sum;
  TextEditingController value1 = new TextEditingController();
  TextEditingController value2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.2),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Image.asset('image/flutter_logo.png'),
            ),
            Text('Caculator',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Pacifico',
                color: Colors.white,
              )
            ),
          ],
        )
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: TextField(
              style: TextStyle(fontFamily: 'Pacifico', fontSize: 20),
              keyboardType: TextInputType.number,
              controller: value1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: TextField(
              style: TextStyle(fontFamily: 'Pacifico', fontSize: 20),
              keyboardType: TextInputType.number,
              controller: value2,
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add, color: Colors.red),
                      Text('Plus', style: TextStyle(fontSize: 20),),
                    ]
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 165, 145, 1),
                    //alignment: Alignment.bottomRight
                  ),
                ),
              ),
              DropdownButton(items: []),
            ],
          ),
          Text('$sum')
        ]
      )
    );
  }
}