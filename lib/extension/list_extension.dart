extension ListExtension on List {
  List pickRandomItemsAsList(int count) =>
      (toList()..shuffle()).take(count).toList();

  List pickRandomItemsAsListWithSubList(int count) =>
      (toList()..shuffle()).sublist(0, count);
}

extension IterableExtension on Iterable {
  Iterable pickRandomItems(int count) => (toList()..shuffle()).take(count);
}
