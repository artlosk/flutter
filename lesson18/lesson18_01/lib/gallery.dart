import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Gallery extends StatelessWidget {
  const Gallery({Key? key, required this.gallery}) : super(key: key);

  final List<XFile> gallery;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: gallery
          .map(
            (e) => Container(
              padding: EdgeInsets.all(1.0),
              color: Colors.black,
              child: Image.file(
                File(e!.path),
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
          )
          .toList(),
    );
  }
}
