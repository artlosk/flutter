// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

var firstScreen = "/";
var secondScreen = "/second";

final List<String> imgList = [
  'assets/images/01.jpg',
  'assets/images/02.jpg',
  'assets/images/03.jpg',
  'assets/images/04.jpg',
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lesson 3',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: firstScreen,
        routes: {
          firstScreen: (BuildContext context) => FirstScreen(),
          secondScreen: (BuildContext context) => SecondScreen()
        });
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String title = 'Svg picture';
    return Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Stack(children: <Widget>[
          Container(
              alignment: Alignment.center,
              child: Column(children: [
                SvgPicture.asset('assets/images/developers.svg'),
                RaisedButton(
                  child: new Text("Go to Second Screen"),
                  onPressed: () {
                    Navigator.pushNamed(context, secondScreen);
                  },
                )
              ])),
        ]));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String title = 'Carousel';
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Builder(builder: (context) {
        return Stack(children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  // autoPlay: false,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(child: Image.asset(item)),
                        ))
                    .toList(),
              ),
              RaisedButton(
                child: new Text("Go to First Screen"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ]),
          )
        ]);
      }),
    );
  }
}
