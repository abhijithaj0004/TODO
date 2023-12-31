// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/db_functions/db_functions.dart';
import 'package:todo_app/widgets/todo_tile.dart';
import 'package:todo_app/widgets/alert_diologue.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //reference for hive box
  final _mybox = Hive.box('mybox');
  @override
  void initState() {
    if (_mybox.get('TODOLIST') == null) {
      tD.createInitialData();
    } else {
      //if data already exists
      tD.loadData();
    }

    // TODO: implement initState
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();
  ToDoListModel tD = ToDoListModel();
  checkboxChanged(bool? value, int index) {
    setState(() {
      tD.toDoList.value[index][1] = !tD.toDoList.value[index][1];
    });
    tD.updateDataBase();
  }

//add new task
  saveNewTask() {
    setState(() {
      tD.toDoList.value.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    tD.updateDataBase();
  }

//delete task
  deleteTask(int index) {
    setState(() {
      tD.toDoList.value.removeAt(index);
    });
    tD.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
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
        body: ValueListenableBuilder(
            valueListenable: tD.toDoList,
            builder: (context, value, _) {
              return tD.toDoList.value.isNotEmpty
                  ? ListView.builder(
                      itemCount: tD.toDoList.value.length,
                      itemBuilder: (context, index) {
                        return ToDoTile(
                          taskName: tD.toDoList.value[index][0],
                          taskCompleted: tD.toDoList.value[index][1],
                          onChanged: (value) {
                            checkboxChanged(value, index);
                          },
                          deleteFunction: (context) => deleteTask(index),
                        );
                      },
                    )
                  : Center(
                      child: Text('List is Empty'),
                    );
            }));
  }
}
