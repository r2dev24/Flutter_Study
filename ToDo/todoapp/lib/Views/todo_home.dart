import 'package:flutter/material.dart';
import 'package:todoapp/db/db_helper.dart';
import 'package:todoapp/models/todo.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final dbHelper = DbHelper();
  List<ToDo> todos = [];

  @override
  void initState() {
    super.initState();
    _refreshTodos();
  }

  void _refreshTodos() async {
    final data = await dbHelper.getToDos();
    setState(() {
      todos = data;
    });
  }

  //Add ToDo
  void _addTodo() async {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    await showDialog(
      context: context, 
      builder: (_) => AlertDialog(
        title: Text('Add To-Do'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Title
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: '타이틀'),
            ),
            //Description
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: '설명'),
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newTodo = ToDo(
                title: titleController.text,
                description: descriptionController.text
              );

              dbHelper.insertToDo(newTodo);
              _refreshTodos();
              Navigator.of(context).pop();
            }, 
            child: Text('추가')
          )
        ],
      )
    );
  }

  // Delete ToDo
  void _deleteTodo(int id) async {
    await dbHelper.deletedTodo(id);
    _refreshTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('투두 리스트(ToDo List)'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];

          return ListTile(
            title: Text(todo.title),
            subtitle: Text(todo.description),
            trailing: IconButton(
              onPressed: () => _deleteTodo(todo.id!), 
              icon: Icon(Icons.delete)
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}