import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp(),
    );
  }
}

class HttpApp extends StatefulWidget {
  const HttpApp({ Key? key }) : super(key: key);

  @override
  _HttpAppState createState() => _HttpAppState();
}

class _HttpAppState extends State<HttpApp> {
  String? result;
  List? data;

  void initState(){
    super.initState();
    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Test'),
      ),
      body: Container(
        child: Center(
          child: data!.length ==0 ?
            Text('No data', style: TextStyle(fontSize: 30), textAlign: TextAlign.left) 
            : ListView.builder(
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Text(data![index]['title'].toString()),
                        Text(data![index]['author'].toString()),
                        Text(data![index]['sale_price'].toString()),
                        Text(data![index]['status'].toString()),
                        Image.network(
                          data![index]['thumbnail'],
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        )
                      ],
                    ),
                  );
                },
                itemCount: data!.length,
              )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getJson();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJson() async {
    var url = 'https://dapi.kakao.com/v3/search/book?target=title&query=doit';
    var response = await http.get(Uri.parse(Uri.encodeFull(url)),  //매우 중요1!!
          headers :  {'Authorization': 'KakaoAK a449b5ff8bdc26560a61b10059d7c9af'}); // REST API KEY 
    setState(() {
      var dataConvertedToJson = json.decode(response.body);
      List result = dataConvertedToJson['documents'];
      data!.addAll(result);
    });
    return response.body;
  }
}


