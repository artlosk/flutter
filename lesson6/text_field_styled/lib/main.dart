import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Text field styled'),
      // ),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                focusColor: Colors.purple,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.purple, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.purple, width: 1),
                ),
                hintText: 'Введите значение',
                label: Text('Search'),
                labelStyle: TextStyle(color: Colors.purple),
                helperText: 'Поле для поиска заметок',
                suffixIcon: Icon(Icons.search, color: Colors.purple,),
                suffixIconColor: Colors.purple,
              ),
            ),
          )),
    );
  }
}
