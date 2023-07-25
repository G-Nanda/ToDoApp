class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });

  static List<ToDo> todoList(){
    return [
      ToDo(id: '01', todoText: "Spending time with Parents"),
      ToDo(id: '02', todoText: "Office works"),
      ToDo(id: '03', todoText: "Check Emails"),
      ToDo(id: '04', todoText: "Breakfast",isDone: true),
      ToDo(id: '05', todoText: "Bathing ",isDone: true),
      ToDo(id: '06', todoText: "Morning Exercise"),

    ];

  }
}