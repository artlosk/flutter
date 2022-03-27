import 'package:flutter/material.dart';
import 'package:lesson20_01/data/category.dart';

class InfoView extends StatelessWidget {
  const InfoView({Key? key, required this.category}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(top:5, bottom: 20), child: Text(
              category.title,
              style: const TextStyle(fontSize: 20),
            ),),
            Text(category.description),
          ],
        ),
      ),
    );
  }
}
