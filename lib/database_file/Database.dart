import 'package:attendance/data/data.dart';
import 'package:hive/hive.dart';

class DataBase {

 final _mybox = Hive.box('Mybox'); 

 List toDoList = [];

 void createInitails(){
  toDoList = [
    ["Default 1",3,5,38],
    ["Default 2",4,5,44]
  ];
 }

 void loadData(){
  toDoList = _mybox.get("TODOLIST");
 }

 void updateData(){
  _mybox.put("TODOLIST", toDoList);
 }


}