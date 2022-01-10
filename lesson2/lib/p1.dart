import 'dart:math';

///Реализуйте методы вычисления НОД и НОК целых чисел.
///Реализуйте метод, который разбивает число на простые множители и возвращает их.
class P1 {
  int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
  }

  int lcm(int a, int b) {
    return (a / this.gcd(a, b) * b).toInt();
  }

  factor(int n) {
    List<int>numbers = [];

    for (int i = 2; i <= sqrt(n); i++) {
      while (n % i == 0) {
        numbers.add(i);
        n ~/= i;
      }
    }

    if (n != 1) {
      numbers.add(n);
    }

    return numbers;
  }
}