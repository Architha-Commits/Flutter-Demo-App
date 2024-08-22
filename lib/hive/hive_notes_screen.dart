import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:master_go_replication/hive/hive_notes_method.dart';

class HiveNotesScreen extends StatefulWidget {
  const HiveNotesScreen({super.key});

  @override
  State<HiveNotesScreen> createState() => _HiveNotesScreenState();
}

class _HiveNotesScreenState extends State<HiveNotesScreen> {
  TextEditingController controller = TextEditingController();
  HiveNotesMethod hiveNotesMethods = HiveNotesMethod();

//To display pop up when clicked
  void showPopUp({int? index}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: controller,
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (index == null) {
                      hiveNotesMethods.createNote(controller.text);
                      setState(() {});
                    } else {
                      hiveNotesMethods.updateNote(index, controller.text);
                      setState(() {});
                    }
                    controller.clear();

                    Navigator.of(context).pop();
                  },
                  child: const Text("Submit"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<String> notesList = hiveNotesMethods.getNotes();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive CRUD"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showPopUp,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  title: Text(notesList[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            hiveNotesMethods.deleteNote(index);
                            setState(() {});
                            Fluttertoast.showToast(msg: "Deleted");
                          },
                          icon: const Icon(Icons.delete)),
                      IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () => showPopUp(index: index),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
