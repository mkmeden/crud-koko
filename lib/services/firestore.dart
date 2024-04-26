import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //get collection of notes

  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  //CREATE  :  add a new note

Future<dynamic>addNote(String note) async
{
   return await notes.add({
  'note' : note ,
   'timestamp' : Timestamp.now()
});
}

  //READ : get notes from database


  //UPDATE : Update the notes for a given doc id


  //DELETE : delete a note for the given doc id
}