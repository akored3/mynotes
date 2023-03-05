//Filter function to filter notes of users , to get currentUser's notes
extension Filter<T> on Stream<List<T>> {
  //So basically , we want a list of stream that passed a test of a given condition from another list of stream
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}

//Revision

void main() {
  final stream = Stream.fromIterable([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ]);

  final filteredStream = stream.filter((x) => x % 2 == 0);

  filteredStream.listen((list) => print(list));

  final numbers = [1, 2, 3, 4, 5];
  final streamy = Stream.fromIterable(numbers);
  stream.listen((number) => number.toList());
}
