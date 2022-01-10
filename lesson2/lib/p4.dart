///Есть коллекция слов.
///Реализуйте метод, возвращающий Map.
///Данный Map должен соотносить слово и количество его вхождений в данную коллекцию.
class P4
{
  Map generateMap(List collection)
  {
    Map newCollection = {};

    for (var element in collection) {
      if (newCollection.containsKey(element)) {
        newCollection[element]++;
      } else {
        newCollection[element] = 1;
      }
    }

    return newCollection;
  }
}