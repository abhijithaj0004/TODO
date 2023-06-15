import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/widgets/todo_tile.dart';
import 'package:todo_app/widgets/alert_diologue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  List toDoList = [
    ['Do Exercise', false]
  ];
  checkboxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

//add new task
  saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

//delete task
  deleteTask(
    int index,
  ) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // if list is empty
    taskIsEmpty() {
      setState(() {
        Center(
          child: Text(
            'Add New Task',
            style: TextStyle(color: Colors.black),
          ),
        );
      });
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return DiologueBox(
                  controller: _controller,
                  onSave: saveNewTask,
                  onCancel: () => Navigator.of(context).pop(),
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
        backgroundColor: Color.fromARGB(255, 248, 239, 138),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'To Do',
            style: GoogleFonts.acme(textStyle: TextStyle(fontSize: 30)),
          ),
        ),
        body: toDoList.isEmpty
            ? taskIsEmpty()
            : ListView.builder(
                itemCount: toDoList.length,
                itemBuilder: (context, index) {
                  return ToDoTile(
                    taskName: toDoList[index][0],
                    taskCompleted: toDoList[index][1],
                    onChanged: (value) {
                      checkboxChanged(value, index);
                    },
                    deleteFunction: (context) => deleteTask(index),
                  );
                },
              ));
  }
}
