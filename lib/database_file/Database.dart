import 'package:attendance/data/data.dart';
import 'package:hive/hive.dart';

class DataBase {

 final _mybox = Hive.box('Mybox'); 

 List toDoList = [];

 void createInitails(){
  toDoList = [
    Data(className: "Microwave",attended: 3,bunked:5,type: Type.theory),
    Data(className: "Dsp",attended: 5,bunked: 4, type: Type.theory),
  ];
 }

 void loadData(){
  toDoList = _mybox.get("TODOLIST");
 }

 void updateData(){
  _mybox.put("TODOLIST", toDoList);
 }


}