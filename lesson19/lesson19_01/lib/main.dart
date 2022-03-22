import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lesson19_01/service.dart';

import 'dummy/platform_view_dummy.dart'
if (dart.library.html) 'web/platform_view_web.dart'
if (dart.library.io) 'mobile/platform_view_mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final service = getService();
  String _text = '';
  StreamSubscription? _subscription;

  _getValue() async {
    var text = await service.getValue();
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'UI component from platform',
              style: style,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PlatformViewWidget(),
              ),
            ),
            Text('Events from platform:', style: style),
            StreamBuilder(
              stream: service.getStream(),
              builder: (context, snapshot) => Text(
                '${snapshot.hasData ? snapshot.data : ''}',
                style: style,
              ),
            ),
            ElevatedButton(onPressed: _getValue, child: Text('Flutter Button')),
            Text('Method channel from platform', style: style,),
            Text(_text, style: style,),
          ],
        ),
      ),
    );
  }
}
