import 'package:attendance/database_file/Database.dart';
import 'package:attendance/widget/data_items.dart';
import 'package:flutter/material.dart';
import 'package:attendance/data/data.dart';
import 'package:attendance/widget/dialog.dart';
import 'package:hive/hive.dart';

class MainScreen  extends StatefulWidget{

  MainScreen({super.key});

  

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>{

  final _mybox = Hive.box('Mybox');

  DataBase db = DataBase();

  @override
  void initState() {
    
    if(_mybox.get("TODOLIST") == null){
      db.createInitails();
    }else{
      db.loadData();
    }

    super.initState();
  }

 

  final _textController = TextEditingController();


  void addNewSubject(){
    if(_textController.text.isEmpty){
      showDialog(
        context: context,
       builder: (context) => AlertDialog(
        content: Text("Enter a Valid Subject Name"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
       ));
    }else{
      setState(() {
        print("object");
        db.toDoList.add(
          [_textController.text,0,0,0],
        );
        _textController.text = "";
        Navigator.pop(context);
      });
    }
    db.updateData();
  }




  void createNew(){
    showDialog(
      context: context,
       builder: (context) {
        return DialogItems(
          controller: _textController,
          onSave: addNewSubject,
          onCancel: () {
            _textController.text = "";
            Navigator.pop(context);
          },
        );
       });
  }

  void performDelete(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance Tracker"),
        actions: [
          IconButton(
            onPressed: createNew,
             icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (ctx,index) => DateItem(classname: db.toDoList[index][0],
        attended: db.toDoList[index][1],
        bunked: db.toDoList[index][2],
        percent: db.toDoList[index][3],
        deleteFunction: (ctx) => performDelete(index),
        )),
    );
  }
}