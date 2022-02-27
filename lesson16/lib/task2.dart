import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'package:lesson16/platforms.dart';

class Task2 extends StatefulWidget {
  final String title;

  const Task2({Key? key, required this.title}) : super(key: key);

  @override
  _Task2State createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  String _head1Text = '';
  String _bodyText = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'https://flutter.dev');
  }

  Future<void> loadHtmlPage() async {
    final result = await http.get(Uri.parse(_controller.text));
    setState(() {
      _bodyText = result.body;
      var document = parse(result.body);
      _head1Text = document
          .getElementsByTagName("title")[0]
          .text
          .replaceAll("\n", "")
          .trimLeft();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _controller,
                  ),
                ),
                ElevatedButton(
                  child: const Text('Load'),
                  onPressed: () {
                    loadHtmlPage();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Application running on ${Platforms.platform.name}'
                    .toUpperCase(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              _head1Text,
              style: const TextStyle(fontSize: 26),
            ),
            Text(_bodyText)
          ],
        ),
      ),
    );
  }
}