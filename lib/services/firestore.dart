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

Stream<QuerySnapshot> getNotesStream()
{
  final notesStream = notes.orderBy('timestamp' , descending: true).snapshots();
  return notesStream;
}

  //UPDATE : Update the notes for a given doc id

Future<dynamic> updateNote(String docID , String note) async {

  return await notes.doc(docID).update({
    'note' : note ,
    'timestamp' : Timestamp.now()
  });
}

  //DELETE : delete a note for the given doc id

Future<dynamic> deleteNote(String docID) async
{
  return await notes.doc(docID).delete();
}

}