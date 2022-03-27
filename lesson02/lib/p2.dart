import 'dart:math';

///Реализуйте методы для преобразования целых чисел из десятичной системы в двоичную и обратно.
class P2 {
  convertToBinary(int value) {
    int b;
    String temp = "";
    while (value != 0) {
      b = value % 2;
      temp = b.toString() + temp;
      value ~/= 2;
    }
    return temp;
  }

  convertToDecimal(String binaryString) {
    int n = binaryString.length;
    int decimal = 0;
    for (int d = 0; d < n; d++){
      // append a bit=0 (i.e. shift left)
      decimal = decimal << 1;

      // if biStr[d] is 1, flip last added bit=0 to 1
      if (binaryString[d] == '1'){
        decimal = decimal | 1; // e.g. dec = 110 | (00)1 = 111
      }
    }
    return decimal;
  }
}
