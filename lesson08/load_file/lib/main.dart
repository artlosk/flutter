import 'package:flutter/material.dart';
import 'fetch_file.dart';

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
      home: MyHomePage(title: 'Load file'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = new TextEditingController();

  Future<String> contentFromFile;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.never,

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(0.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                        ),
                        label: Text('Введите название файла'),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      padding: EdgeInsets.only(top: 21.5, bottom: 21.5),
                      onPressed: () {
                        setState(() {
                            contentFromFile = fetchFileFromAssets('assets/${searchController.text}.txt', searchController);
                        });
                      },
                      child:
                          Text("Найти", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: FutureBuilder<String>(
                    future: contentFromFile,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      }

                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                            child: Text(''),
                          );
                          break;
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                          break;
                        case ConnectionState.done:
                          return SingleChildScrollView(
                              child: Text(snapshot.data));
                          break;
                        default:
                          return SingleChildScrollView(
                            child: Text('Default'),
                          );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
