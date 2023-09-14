import 'package:attendance/widget/data_items.dart';
import 'package:flutter/material.dart';
import 'package:attendance/data/data.dart';
import 'package:attendance/widget/dialog.dart';

class MainScreen  extends StatefulWidget{

  MainScreen({super.key});

  

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen>{

  final List<Data> _dataList = [
    Data(className: "Microwave", bunked: 2, attended: 6, type: Type.theory),
    Data(className: "Dsp", bunked: 1, attended: 6, type: Type.theory),
  ];

  final _textController = TextEditingController();




  void createNew(){
    showDialog(
      context: context,
       builder: (context) {
        return DialogItems(
          controller: _textController,
          onCancel: () {
            _textController.text = "";
            Navigator.pop(context);
          },
        );
       });
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
        itemCount: _dataList.length,
        itemBuilder: (ctx,index) => DataItem(
          classname: _dataList[index].className,
          clasbunked: _dataList[index].bunked,
          classgone: _dataList[index].attended,
        )),
    );
  }
}