import 'package:flutter/material.dart';

class DataItem extends StatelessWidget{

  double percetage(){

    return (classgone/(clasbunked+classgone))*100;
  }


  DataItem({super.key,
  required this.classname,
  required this.clasbunked,
  required this.classgone});

  final String classname;
  final int classgone;
  final int clasbunked;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        
        child: Column(
          children: [
            Text(classname),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Class Attended"),
                Spacer(),
                Row(
                  children: [
                    Text("$classgone"),
                    IconButton(
                      onPressed: () {},
                       icon: Icon(Icons.add))
                  ],
                )
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Class Bunked"),
                Spacer(),
                Row(
                  children: [
                    Text("$clasbunked"),
                    IconButton(
                      onPressed: () {},
                       icon: Icon(Icons.add))
                  ],
                )
              ],
            ),

            Row(
              children: [
                Text("Percentage Attendance"),
                SizedBox(width: 16,),
                Text("comming soon")
              ],
            )

          ],
        ),
      ),
    );
  }
}