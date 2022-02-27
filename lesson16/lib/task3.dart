import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:lesson16/platforms.dart';
import 'package:lesson16/mock_webview.dart'
    if (dart.library.io) 'non_web_platform_webview.dart'
    if (dart.library.html) 'web_platform_webview.dart';

class Task3 extends StatefulWidget {
  final String title;

  const Task3({Key? key, required this.title}) : super(key: key);

  @override
  _Task3State createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  String _head1Text = '';
  late TextEditingController _controller;
  Widget content = Container();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'https://flutter.dev');
  }

  Future<void> loadHtmlPage() async {
    final result = await http.get(Uri.parse(_controller.text));
    setState(() {
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
                    setState(() {
                      content = webView(_controller.text);
                    });
                    //loadHtmlPage();
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
      body: Column(
        children: [
          Text(
            _head1Text,
            style: const TextStyle(fontSize: 26),
          ),
          Expanded(
            child: content,
          ),
        ],
      ),
    );
  }
}
