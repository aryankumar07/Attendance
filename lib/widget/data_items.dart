import 'package:attendance/database_file/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';


class DateItem extends StatefulWidget{

  DateItem({super.key,required this.classname,
  required this.attended,
  required this.bunked,
  required this.percent,
  required this.deleteFunction,
  });

  final String classname;
  final int attended;
  final int bunked;
  final int percent;
  Function(BuildContext)? deleteFunction;

  @override
  State<DateItem> createState() {
    return _DateItemState(className: classname,
    attended: attended,
    bunked: bunked,
    percent: percent,
    deleteFunction: deleteFunction,
    );
  }
}

class _DateItemState extends State<DateItem>{

    final _mybox = Hive.box('Mybox');

    DataBase db = DataBase();

  _DateItemState({required this.className,
  required this.attended,
  required this.bunked,
  required this.percent,
  required this.deleteFunction,
  });

  final String className;
  int attended;
  int bunked;
  int percent;
  Function(BuildContext)? deleteFunction;

  void updateper(){
    percent = ((attended/(attended+bunked))*100).round();
  }

  void incValattended(){
    setState(() {
      attended += 1;
      updateper();
    });
    db.updateData();
  }

  void incValbunked(){
    setState(() {
      bunked += 1;
      updateper();
    });
    db.updateData();
  }

  void decValAttended(){
    setState(() {
      attended -= 1;
      if(attended<0){
        attended  = 0;
      }
      updateper();
    });
  }

  void decValBunked(){
    setState(() {
      bunked -= 1;
      if(bunked<0){
        bunked  = 0;
      }
      updateper();
    });
    db.updateData();
  }

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
         children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            )
         ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          
          child: Column(
            children: [
              Text(className),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Class Attended"),
                  SizedBox(width: 16,),
                  Text("$attended"),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: incValattended,
                         icon: Icon(Icons.add)),
                         IconButton(
                        onPressed: decValAttended,
                       icon: Icon(Icons.remove)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Text("Class Bunked"),
                  SizedBox(width: 16,),
                  Text("$bunked"),
                  Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: incValbunked,
                         icon: Icon(Icons.add)),
                      IconButton(
                        onPressed: decValBunked,
                       icon: Icon(Icons.remove)),
                    ],
                  )
                ],
              ),
      
              Row(
                children: [
                  Text("Percentage Attendance"),
                  SizedBox(width: 16,),
                  Text("$percent%")
                ],
              )
      
            ],
          ),
        ),
      ),
    );
  }
}