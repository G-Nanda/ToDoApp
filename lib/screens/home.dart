import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Constants/colors.dart';
import 'package:to_do_app/login/authPage.dart';

import '../model/toDo.dart';
import '../widgets/to_do_item.dart';

class Home extends StatefulWidget {
  
   Home({Key?key}):super(key:key);

    @override
    State<Home> createState()=> _HomeState();
}

class _HomeState extends State<Home>{



  final todosList=ToDo.todoList();
  List<ToDo>_foundToDo=[];
  final _toDoController=TextEditingController();


  @override
  void initState(){
    _foundToDo=todosList;
    super.initState();
  }
  
  



  
  
  

  
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50,bottom: 20),
                        child: Text(
                          'Tasks to be accomplished',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500
                          ),                  ),
                      ),
                      for( ToDo todoo in _foundToDo.reversed)

                        ToDoItem(
                          todo: todoo,
                          OnToDoChanged: _handleToDoChange,
                          onDeleteitem: _deletetoDoItem,
                          ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child:Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                      color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    ),],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _toDoController,
                    decoration: InputDecoration(
                      hintText: "Add a new task to be done!",
                      border: InputBorder.none,
                    ),
                  ),
                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text('+',
                      style: TextStyle(
                        fontSize: 40,
                      ),),
                      onPressed: (){
                        _addToDoItem(_toDoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,

                      ),
                      ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo)
  {
    setState(() {
      todo.isDone=!todo.isDone;
      
    });
  }
  void _deletetoDoItem(String id)
  {

    setState(() {
      todosList.removeWhere((item) => item.id==id);
      
    });
      
  }
    
  void _addToDoItem(String toDo)
  {
    if(toDo!='') 
    {
      setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
      ));
    });
      
    }
    
      
    
      
    _toDoController.clear();
     
  }
  void _runFilter(String enteredKeyword) {
    List<ToDo> results=[];
    if(enteredKeyword.isEmpty)
    {
      results=todosList;
    }
    else{
      results=todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo=results;
    });
  }
  
   Widget searchBox(){
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                    size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    minWidth: 25
                  ),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color:tdGrey),

                ),
              ),
            );
   }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      title: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child:
              Row(
                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                  ),
                  Padding(padding:EdgeInsets.only(left: 10.0),
                  child: GestureDetector(

                    onTap: (){
                      showDialog(
      context: context, 
      builder: (context){
        return Center(child: CircularProgressIndicator());
      }
      );
                      FirebaseAuth.instance.signOut();

                         
                        },
                    child: Text('Log Out')),
                  ),
                ],
              ))
            ],
            child: Icon(
              Icons.more_vert,
              size: 28.0,
            ),

          ),
       
        SizedBox(width: 10,),

        Padding(
          padding: const EdgeInsets.only(right: 105.0),
          child: Text("Daily Tasks",
          style: TextStyle(
            color: Colors.white,
          ),),
        ),


        
            
          

        
      ]),
    );
  }
}