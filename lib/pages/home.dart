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
  void openBox(){

    showDialog(context: context, builder: (context)=> AlertDialog(
      content : TextField(
        controller: textController,
      ),

      actions: [
        ElevatedButton(onPressed: () async{

          await firestoreService.addNote(textController.text);
        },
            child: Text('Add'))
      ],

    ));
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
            openBox();
        },
      ),
    );
  }
}
