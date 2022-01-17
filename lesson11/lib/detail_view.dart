import 'package:flutter/material.dart';
import 'package:hero_card/space.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key key, this.data}) : super(key: key);
  final Space data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // child: GestureDetector(
        child: Column(
          children: [
            Stack(
              //fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 600,
                  padding: EdgeInsets.only(top: 200),
                  child: Hero(
                    tag: '${data.id}-description',
                    child: Material(
                      child: Text(data.description),
                    ),
                  ),
                ),
                Hero(
                  tag: '${data.id}-image',
                  child: Material(
                    child: Image.asset(data.image,
                        height: 200, width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 30,
                  top: 170,
                  child: Hero(
                    tag: '${data.id}-icon',
                    child: Material(
                      color: Colors.red,
                      child: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          //Only bottom button click???
                          Navigator.of(context).pop(context);
                          //print('123');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // onTap: () {
        //   Navigator.of(context).pop(context);
        // },
        // ),
      ),
    );
  }
}
