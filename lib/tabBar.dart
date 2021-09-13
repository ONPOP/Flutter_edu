import 'package:flutter/material.dart';
import 'sub/firstpage.dart';
import 'sub/secondpage.dart';
import 'sub/animal.dart';

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
  const MyHomepage({ Key? key }) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> with SingleTickerProviderStateMixin{
  TabController? controller;
  List<Animal>? animalList;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2,vsync: this);
    // animalList = [];
    animalList = [];

    animalList!.add(Animal(animalName: '호랑이1',kind: '동물1', imagePath: 'image/flutter_logo.png',));
    animalList!.add(Animal(animalName: '호랑이2',kind: '동물2', imagePath: 'image/flutter_logo.png',));
    animalList!.add(Animal(animalName: '호랑이3',kind: '동물3', imagePath: 'image/flutter_logo.png',));
    animalList!.add(Animal(animalName: '호랑이4',kind: '동물4', imagePath: 'image/flutter_logo.png',));
    animalList!.add(Animal(animalName: '호랑이5',kind: '동물5', imagePath: 'image/flutter_logo.png',));
    animalList!.add(Animal(animalName: '호랑이6',kind: '동물6', imagePath: 'image/flutter_logo.png',));
  }

  void dispose(){
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: TabBarView(
        children: <Widget> [
          FirstApp(list: animalList!,), SecondApp(list: animalList!),
         ],
        controller: controller,
        ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(icon: Icon(Icons.looks_one, color: Colors.black),),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue),),
        ],
        controller: controller,
      ),
    );
  }
}