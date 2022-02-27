import 'package:flutter/material.dart';
import 'package:lesson16/task1.dart';
import 'package:lesson16/task2.dart';
import 'package:lesson16/task3.dart';
import 'package:lesson16/task4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Main()
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson 16')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(thickness: 2),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Task1(title: "Task1"),
                  ),
                );
              },
              child: const Text('Task#1'),
            ),
            const Divider(thickness: 2),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Task2(title: "Task2"),
                  ),
                );
              },
              child: const Text('Task#2'),
            ),
            const Divider(thickness: 2),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Task3(title: "Task3"),
                  ),
                );
              },
              child: const Text('Task#3'),
            ),
            const Divider(thickness: 2),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Task4(title: "Task4"),
                  ),
                );
              },
              child: const Text('Task#4'),
            ),
            const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}
