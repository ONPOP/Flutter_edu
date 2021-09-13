
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 165, 145, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Pacifico'
      ),
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {

  @override
  _WidgetAppState createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  String sum = '';
  TextEditingController value1 = new TextEditingController();
  TextEditingController value2 = new TextEditingController();

  List _buttonList = ['더하기', '빼기', '곱하기', '나누기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems = [];
  String? _buttonText;  // =========== String _buttonText = ''; 와의 차이점!!! ===============

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0,0,0, 0.02),
        title: Text('Calculator', style: TextStyle(fontSize: 30),),
        ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('$sum', style: TextStyle(fontSize: 25),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: value1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: value2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Text(_buttonText!)  // ==============왜 뒤에 ! 를 붙여야 하는가!!! ==========
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0, 165, 145, 1)
                  ),
                  onPressed: (){
                    setState(() {
                      var value1Int = double.parse(value1.value.text);
                      var value2Int = double.parse(value2.value.text);
                      var result;
                      if(_buttonText == '더하기'){
                        result = value1Int + value2Int;
                      } else if(_buttonText == '빼기'){
                        result = value1Int - value2Int;
                      } else if(_buttonText == '나누기'){
                        result = value1Int / value2Int;
                      } else {
                        result = value1Int * value2Int;
                      }
                      sum = '$result';
                    });
                  }, ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButton(
                  items: _dropDownMenuItems, 
                  onChanged: (String? value){
                    setState(() {
                      _buttonText = value;
                    });
                  },
                  value: _buttonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initState(){
    super.initState();
    for(var item in _buttonList){
      _dropDownMenuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMenuItems[0].value;
    // =========== String _buttonText = ''; 입력 시 오류나는 이유!! ===============
  }
}
