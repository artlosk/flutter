import 'package:flutter/material.dart';
import 'package:lesson_2/p1.dart';
import 'package:lesson_2/p2.dart';
import 'package:lesson_2/p3.dart';
import 'package:lesson_2/p4.dart';
import 'package:lesson_2/p5.dart';
import 'package:lesson_2/p6.dart';
import 'package:lesson_2/task7.dart';
import 'package:lesson_2/user.dart';

void main() {
  ///P1
  final a = 8;
  final b = 10;
  P1 p1 = P1();
  print('НОД: ${p1.gcd(a, b)}');
  print('НОК: ${p1.lcm(a, b)}');

  final numberForEasy = 144;
  print('Простые множители: ${p1.factor(numberForEasy)}');

  ///P2
  P2 p2 = P2();
  int toBinary = 42;
  String binary = p2.convertToBinary(toBinary);
  print(binary);
  print(p2.convertToDecimal(binary));

  ///P3
  P3 p3 = P3();
  String sample = 'asd123 ba3dfa';
  print(p3.getNumbers(sample));

  ///P4
  P4 p4 = P4();
  List words = ['cat', 'cat', 'dog', 'cow', 'rat', 'cow', 'cat', 'cow', 'dog'];
  print(p4.generateMap(words));

  ///P5
  P5 p5 = P5();
  List<dynamic> list = [1, '2', 'zero', 'one', 'two', 'three', 'cat', 'dog'];
  print(p5.getNumbers(list));

  ///P6
  Point p6_1 = Point(1, 2, 3);
  Point p6_2 = Point(4, 5, 6);
  Point p6_3 = Point(10, 20, 30);

  print(p6_1.getDistanceTo(p6_2));
  print(Point.squareTriangle(p6_1, p6_2, p6_3));

  ///P7
  var number1 = 9;
  var number2 = -9;
  try {
    print(number1.findSqrt(2));
    print(number2.findSqrt(2));
  } catch (e) {
    print(e);
  }

  ///P8
  AdminUser adminUser = new AdminUser('artlosk@gmail.com');
  print(adminUser.getMailSystem());
  GeneralUser generalUser = new GeneralUser('user@gmail.com');
  print(generalUser.getMailSystem());

  UserManager userManager = new UserManager();

  userManager.addUser(1, 'admin', 'artlosk@gmail.com');
  userManager.addUser(2, 'user2', 'user2@gmail.com');

  userManager.addUser(2, 'user3', 'user3@gmail.com');//throw because id exist
  userManager.addUser(3, 'user2', 'user2@gmail.com');//throw because email exist

  userManager.addUser(3, 'user3', 'user3@gmail.com');
  userManager.addUser(4, 'user4', 'user4@gmail.com');

  print(userManager.listUser());
  //userManager.removeUserById(2);
  //print(userManager.listUser());


}
