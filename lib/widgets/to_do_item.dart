import 'package:flutter/material.dart';
import 'package:to_do_app/Constants/colors.dart';

import '../model/toDo.dart';
 class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final OnToDoChanged;
  final onDeleteitem;

   const ToDoItem({Key?key,required this.todo,required this.OnToDoChanged,required this.onDeleteitem}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 20),
      child: ListTile(
        onTap: (){
          OnToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(

          todo.isDone ? Icons.check_box:Icons.check_box_outline_blank,
          color: tdBlue,
          ),
        title: Text(
          todo.todoText!,
        style: TextStyle(
          fontSize: 16,
          color: tdBlack,
          decoration: todo.isDone? TextDecoration.lineThrough:null,
        ),
        ),
        trailing: Container(
          
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadiusDirectional.circular(5),
          ),
          child: IconButton(

            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: (){
              //print("Clicked on delete icon");
              onDeleteitem(todo.id);
            },


          ),
        ),
          

      ),
    );
  }
}