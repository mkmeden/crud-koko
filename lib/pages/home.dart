import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:crud/services/firestore.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final FirestoreService firestoreService = FirestoreService();

  //text controller
  final TextEditingController textController = TextEditingController();


  // open a small box to take in user input
  void openBox(String? docID){

    showDialog(context: context, builder: (context)=> AlertDialog(
      content : TextField(
        controller: textController,
      ),

      actions: [
        ElevatedButton(onPressed: () async{

          if(docID == null)
          {
            await firestoreService.addNote(textController.text);
          }

          else{
            await firestoreService.updateNote(docID, textController.text);
          }

          textController.clear();

          Navigator.pop(context);
        },
            child: Text('Add'))
      ],

    ));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff424242), Color(0xff262626)],
              stops: [0.25, 0.75],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )


          ),
        ),
        title: Text('C R U D' ,
        style:  TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.add ,
        color: Colors.white,
        ),
        onPressed: (){
            openBox(null);
        },
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot){

          if(snapshot.hasData)
            {
              List notesList = snapshot.data!.docs;

              return ListView.builder(
                itemCount: notesList.length,
                  itemBuilder: (context , index){
                    DocumentSnapshot document = notesList[index];
                    String docID = document.id;

                    Map<String , dynamic > data = document.data() as Map<String , dynamic>;
                    String noteText = data['note'];

                    return Container(
                      alignment: Alignment.center,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 30),
                        child: ListTile(
                          title: Text(noteText,
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20,
                          ),
                          ),
                          trailing: Row(

                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: (){
                                  firestoreService.deleteNote(docID);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: (){
                                      openBox(docID);
                                },
                                icon: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );

                  }
              );
            }

          else
            {
              return const Text('No notes');
            }
        },
      ),
    );
  }
}
