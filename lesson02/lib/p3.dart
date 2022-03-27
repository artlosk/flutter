///Реализуйте метод, который принимает строку слов, разделённых пробелами.
///Задача — найти в данной строке числа и вернуть коллекцию num этих чисел.
class P3
{
  List getNumbers(String sample)
  {
    List collection = [];
    List temp = sample.split(' ');

    if (temp.isNotEmpty) {
      for(var i=0; i < temp.length; i++) {
        collection.add(temp[i].replaceAll(RegExp('[^0-9]'), ''));
      }
    }

    return collection;
  }
}