import 'package:flutter/material.dart';
import 'package:homework41/controller/todo_controller.dart';
import 'package:homework41/views/widgets/add_dialog.dart';
import 'package:homework41/views/widgets/plan_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<HomePage> {
  TodoController todoController = TodoController();

  void onDone(int i) {
    todoController.todoList[i].checkDone =
        !todoController.todoList[i].checkDone;
    setState(() {});
  }

  void onDeleted(int i) {
    todoController.deletePlan(i);
    setState(() {});
  }

  void onEdited() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int counter = todoController.counter();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text("To Do"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Done: ${todoController.todoList.length - counter}",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal),
              ),
              Text(
                "Not done: $counter",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: todoController.todoList.length,
              itemBuilder: (context, i) {
                return PlanWidget(
                  model: todoController.todoList[i],
                  onDone: () => onDone(i),
                  onDeleted: () => onDeleted(i),
                  onEdited: onEdited,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.deepPurple,
              onPressed: () async {
                Map<String, dynamic>? data = await showDialog(
                  context: context,
                  builder: (context) {
                    return AddDialog();
                  },
                );
                if (data != null) {
                  todoController.add(data["title"], data["date"]);
                }
                setState(() {});
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
