//Filter function to filter notes of users , to get currentUser's notes
extension Filter<T> on Stream<List<T>> {
  //So basically , we want a list of stream that passed a test from another list of stream.... i hope this makes sense?
  Stream<List<T>> filter(bool Function(T) where) =>
      map((items) => items.where(where).toList());
}
