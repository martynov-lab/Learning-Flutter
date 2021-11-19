import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/provider/todo_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _taskController = TextEditingController();
    TextEditingController _searchController = TextEditingController();
    // Color? PrimaryColor = Colors.black54;
    return Consumer<TodoProvider>(
      builder: (context, todoProvider, child) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: todoProvider.PrimaryColor,
            title: todoProvider.appBar
                ? Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            onEditingComplete: () {
                              if (_taskController != "") {
                                todoProvider.add(
                                  Todo(
                                    id: UniqueKey(),
                                    title: _taskController.text,
                                    isDone: false,
                                  ),
                                );
                                _taskController.clear();
                              }
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            controller: _taskController,
                            decoration:
                                InputDecoration(hintText: "Введите текст"),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_taskController.text != "") {
                              todoProvider.add(
                                Todo(
                                  id: UniqueKey(),
                                  title: _taskController.text,
                                  isDone: false,
                                ),
                              );
                              _taskController.clear();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Введите задачу'),
                                backgroundColor: Colors.green,
                              ));
                            }
                          },
                          child: Text("Добавить"),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: TextField(
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      controller: _searchController,
                      onChanged: (value) {
                        todoProvider.searchResults(value);
                      },
                      onTap: () {
                        todoProvider.isSearch();
                      },
                      decoration: InputDecoration(
                        hintText: "Поиск",
                        suffixIcon: todoProvider.isSearching
                            ? IconButton(
                                onPressed: () {
                                  todoProvider.isSearching = true;
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  _searchController.clear();
                                },
                                icon: Icon(Icons.close),
                              )
                            : Icon(Icons.search),
                      ),
                    ),
                  ),
            bottom: TabBar(
              onTap: (index) {
                todoProvider.changeColor(index);
                todoProvider.chandeAppBar(index);
              },
              tabs: [
                Tab(text: "Список задач"),
                Tab(text: "Выполненные задачи")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //СПИСОК ЗАДАЧ
              ListView(
                key: PageStorageKey("task"),
                children: [
                  ...todoProvider.todo.map(
                    (todo) => CheckboxListTile(
                      value: todo.isDone,
                      onChanged: (v) {
                        todoProvider.done(todo.id);
                      },
                      title: Text(todo.title),
                    ),
                  ),
                ],
              ),
              //ВЫПОЛНЕННЫЫЕ ЗАДАЧИ
              GestureDetector(
                onTap: () {
                  _searchController.clear();
                  todoProvider.isSearch();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: ListView(
                  children: [
                    if (_searchController.text == "")
                      ...todoProvider.todo.map(
                        (todo) => todo.isDone
                            ? ListTile(
                                title: Text(todo.title),
                                onTap: () {
                                  //  удаление выполненной задачи
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleDialog(
                                          title: const Text(
                                              'Вы уверены что хотите удалить задачу'),
                                          children: <Widget>[
                                            SimpleDialogOption(
                                              child: Text('Да'),
                                              onPressed: () {
                                                todoProvider.delete(todo.id);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            SimpleDialogOption(
                                              child: Text('Нет'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                              )
                            : SizedBox(
                                height: 0,
                              ),
                      )
                    else
                      ...todoProvider.searchList.map(
                        (task) => ListTile(
                          title: Text(task),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                    title: const Text(
                                        'Вы уверены что хотите удалить задачу'),
                                    children: <Widget>[
                                      SimpleDialogOption(
                                        child: Text('Да'),
                                        onPressed: () {
                                          todoProvider.searchList.removeWhere(
                                              (element) => element == task);
                                          todoProvider.todo.removeWhere(
                                              (element) =>
                                                  element.title == task);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      SimpleDialogOption(
                                        child: Text('Нет'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
