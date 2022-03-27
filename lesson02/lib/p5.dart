///Есть коллекция строк вида ‘one, two, three, cat, dog’ или любого другого.
///Реализуйте метод, возвращающий цифры без повторений, которые встречаются в данной строке.
///Однако цифры встречаются в виде английских слов от zero до nine.
///Например, в результате строки ‘one, two, zero, zero’ мы получим следующий результат: [1, 2, 0]. Если в строке есть слова, не являющиеся цифрами от 0 до 9, пропускайте их.
class P5
{
  String getNumbers(List list)
  {
    Set output = {};
    Map dictionary = {
      'zero' : 0,
      'one' : 1,
      'two' : 2,
      'three' : 3,
      'four' : 4,
      'five' : 5,
      'six' : 6,
      'seven' : 7,
      'eight' : 8,
      'nine' : 9
    };

    for(var element in list) {

      if (element is int) {
        output.add(element);
      } else if (int.tryParse(element) != null) {
        output.add(int.parse(element));
      } else if (dictionary.containsKey(element)) {
        output.add(dictionary[element]);
      }

    }

    return output.toString();
  }
}