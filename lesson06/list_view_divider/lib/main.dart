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
  MyHomePage({Key key, this.index}) : super(key: key);
  final String index;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listData = List.generate(50, (index) {
    return MyCard(index: index.toString());
  });
  ScrollController controller = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    super.initState();
    //controller.addListener(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            controller: controller,
            itemCount: listData.length,
            itemBuilder: (context, index) => listData[index]
        )
    );
  }
}

class MyCard extends StatefulWidget {
  MyCard({Key key, this.index}) : super(key: key);
  final String index;

  @override
  MyCardState createState() => MyCardState();
}

class MyCardState extends State<MyCard> {
  @override
  void initState() {
    super.initState();
    print('init ${widget.index}');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose ${widget.index}');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            child: Column(children: [
              ListTile(title: Text('${widget.index}')),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
                      child: Divider(
                          color: Colors.grey, height: 18, thickness: 2)),
                ),
                Text("♥"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 5.0),
                      child: Divider(
                          color: Colors.grey, height: 18, thickness: 2)),
                ),
              ]),
            ])));
  }
}
