class CloudStorageException implements Exception {
  const CloudStorageException();
}

//Upon creating a new note and Firebase cloud store could'nt create it we throw this exception
//C
class CouldNotCreateNoteException implements CloudStorageException {}

//R
class CouldNotGetAllNotesException implements CloudStorageException {}

//U
class CouldNotUpdateNotesException implements CloudStorageException {}

//D
class CouldNotDeleteNotesException implements CloudStorageException {}
