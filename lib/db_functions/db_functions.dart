import 'package:hive_flutter/hive_flutter.dart';

class ToDoListModel {
  List toDoList = [];
  final _mybox = Hive.box('mybox');

  //run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ['Do Daily Exercise', false],
    ];
  }

  //load the data from database
  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  //update the database
  void updateDataBase() {
    _mybox.put('TODOLIST', toDoList);
  }
}
