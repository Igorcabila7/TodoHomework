import 'package:flutter/material.dart';
import 'package:todohomework/Pages/utils/Todo_list.dart';
import 'Theme/Darkmode.dart';
import 'Theme/Lightmode.dart';

class HomePage extends StatefulWidget
{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller =  TextEditingController();
  List toDoList =[
   ['Learning flutter',false],
   ['Drink Coffe',false],
  ];

  void checkBoxChanged(int index)
  {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
    
  }
  void savenewtask()
  {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }
  void deletedtask(int index)
  {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Todo Work"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(BuildContext context, index)
      {

        return  TodoList(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChaged: (value)=> checkBoxChanged(index),
          deleteFunction:(contex)=>deletedtask(index) ,
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
           Expanded(child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 26
             ),
             child: TextField(
              controller: _controller, 
              decoration: InputDecoration(
                hintText: 'Adicione uma tarefa nova',
                filled: true,
                fillColor: Colors.grey,
                enabledBorder:OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                 focusedBorder:OutlineInputBorder(
                  borderSide: const BorderSide(
                  color: Colors.black,),
             ),
           )),
           ),
           ),
           FloatingActionButton(onPressed: savenewtask,
           child: const Icon(Icons.add),),
          ],
        ),
      ),
    );
  }
}