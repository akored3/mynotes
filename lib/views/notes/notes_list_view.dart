import 'package:flutter/material.dart';
import 'package:mynotes/services/auth/crud/notes_service.dart';
import 'package:mynotes/services/cloud/cloud_note.dart';
import 'package:mynotes/utilities/dialog/delete_dialog.dart';

//We're making the list of notes another component
//Careful now, the list of note shouldn't have any connection with the NoteService

//A typedef can be used to specify a function signature that we want specific functions to match
typedef NoteCallBack = void Function(CloudNote note);

class NotesListView extends StatelessWidget {
  //Notes list requires a list of DatabseNote to render of course
  final Iterable<CloudNote> notes;

  final NoteCallBack onDeleteNote;

  final NoteCallBack onTap;

  const NotesListView({
    super.key,
    required this.notes,
    required this.onDeleteNote,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        final note = notes.elementAt(index);
        return ListTile(
          onTap: () {
            onTap(note);
          },
          title: Text(
            note.text,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () async {
              final shouldDelete = await showDeleteDialog(context);
              if (shouldDelete) {
                //Then we call the onDeleteNote call back and pass the current note
                onDeleteNote(note);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
    );
  }
}
