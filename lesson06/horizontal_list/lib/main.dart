import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
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
  MyHomePage({Key key, this.index}) : super(key: key);
  final String index;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listData = List.generate(50, (index) {
    return index;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horizontal list'),
        ),
        body: SafeArea(child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          bool hasDetailPage =
              MediaQuery.of(context).orientation == Orientation.landscape;
          double _width = constraints.constrainWidth();
          return Container(
              height: _width < 500 || !hasDetailPage ? 100 : double.infinity,
              child: GridView.builder(
                scrollDirection: _width < 500 || !hasDetailPage
                    ? Axis.horizontal
                    : Axis.vertical,
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: Color.lerp(Colors.redAccent, Colors.purple, index.toDouble()/50),
                      child: Text(listData[index].toString()));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, //_width < 500 ? 3 : 2,
                  childAspectRatio: _width < 500 || !hasDetailPage ? 1 : 6, // _width < 500 ? 2 : 1
                ),
              ));
        })));
  }
}
