import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget{
  const TodoList({super.key, required  this.taskName, required this.taskCompleted, required this.onChaged, required this.deleteFunction});
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChaged;
  final Function(BuildContext)? deleteFunction;
 @override
 Widget build(BuildContext context)
 {
  return Padding(
          padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 0,
          ),
          child:Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children:[SlidableAction(onPressed:deleteFunction,
            icon:
              Icons.delete,
              borderRadius: BorderRadius.circular(15),
              backgroundColor: Colors.red,) ],),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15)
              ),
            child: Row(
              children: [
                Checkbox(value: taskCompleted, onChanged:onChaged, side: BorderSide(color: Colors.white),activeColor: Colors.black,),
                Text(
                  taskName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.grey,
                  decorationThickness: 2,
                ),
                ),
              ],
            )
                    ),
          ),
        );;
 }
}