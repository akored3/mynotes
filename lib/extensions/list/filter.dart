//Filter function to filter notes of users , to get currentUser's notes
extension Filter<T> on Stream<List<T>> {
  //So basically , we want a list of stream that passed a test of a given condition from another list of stream
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}

//Revision



