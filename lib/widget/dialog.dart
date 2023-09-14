import 'package:flutter/material.dart';

class DialogItems extends StatelessWidget{

  DialogItems({super.key,required this.onCancel,required this.controller});
  
  VoidCallback onCancel;
  final controller;

  @override
  Widget build(context) {
    return AlertDialog(
      backgroundColor: Colors.lightBlue,
      content: Container(
        height: 150,
        child: Column(
          children: [
            Text("Class Name"),
            TextField(
              controller: controller,
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                IconButton(
                  onPressed: (){},
                 icon: Icon(Icons.add)),
                 Spacer(),
                 IconButton(
                  onPressed: onCancel,
                  icon: Icon(Icons.cancel))
              ],
            )
          ],
        )
      ),
    );
  }
}