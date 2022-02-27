import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson16/adaptive_widget.dart';
import 'package:lesson16/models/user_model.dart';
import 'package:lesson16/wide_layout.dart';

import 'narrow_layout.dart';

class Task4 extends StatefulWidget {
  final String title;

  const Task4({Key? key, required this.title}) : super(key: key);

  @override
  _Task4State createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  String viewBlocks = 'list';
  bool isLoading = false;
  bool hasError = false;
  late List<UserModel> users;

  @override
  void initState() {
    super.initState();
    getDataUsers();
  }

  Future<List> readJsonData(String asset) async {
    final jsonData = await rootBundle.loadString(asset);
    final list = await json.decode(jsonData);
    return list;
  }

  void getDataUsers() async {
    setState(() {
      isLoading = true;
    });

    try {
      var file = await readJsonData('assets/users.json');
      users = file.map<UserModel>((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      setState(() {
        hasError = true;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError
              ? const Center(
                  child: Text('Error'),
                )
              : AdaptiveWidget(
                  wide: WideLayout(users: users),
                  narrow: NarrowLayout(users: users),
                ),
    );
  }
}
