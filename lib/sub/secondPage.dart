import 'package:flutter/material.dart';
import 'animal.dart';

class SecondApp extends StatefulWidget {
  final List<Animal>? list;
  const SecondApp({ Key? key, required this.list }) : super(key: key);

  @override
  _FirstAppState createState() => _FirstAppState();
}

class _FirstAppState extends State<SecondApp> {
  final nameController = TextEditingController();
  int _radioValue = 0;
  _radioChange(int? value){
      setState(() {
        _radioValue = value!;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                children: <Widget>[
                  Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
                ],
              ),
            ],
          )
        ),
      )
      
    );
    
  }
}

