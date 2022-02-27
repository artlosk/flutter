import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'dart:io' show Platform;

class Task1 extends StatefulWidget {
  const Task1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  String _head1Text = '';
  String _bodyText = '';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'https://flutter.dev');
  }

  Future<void> loadHtmlPage() async {
    http.get(Uri.parse(_controller.text)).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error while fetching data");
      }

      setState(() {
        Map<String, String> headers = response.headers;
        print(headers);

        var document = parse(response.body);
        _head1Text = document
            .getElementsByTagName("title")[0]
            .text
            .replaceAll("\n", "")
            .trimLeft();
        _bodyText = res;
      });
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
        child: Row(
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
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
