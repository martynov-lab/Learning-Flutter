import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todo = [];
  Color? PrimaryColor = Colors.black54;
  bool appBar = true;
  List<Todo> get todo => _todo;
  List<String> searchList = [];
  List<String> isDoneList = [];
  bool isSearching = false;

  void add(Todo newtodo) {
    _todo.add(newtodo);
    notifyListeners();
  }

  done(UniqueKey id) {
    Todo findTodo = _todo.firstWhere((element) => element.id == id);
    findTodo.isDone = !findTodo.isDone;
    if (findTodo.isDone) {
      isDoneList.add(findTodo.title);
    } else {
      isDoneList.removeWhere((element) => element == findTodo.title);
    }

    notifyListeners();
  }

  delete(UniqueKey id) {
    _todo.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  changeColor(index) {
    if (index == 0) {
      PrimaryColor = Colors.black54;
      notifyListeners();
    }
    if (index == 1) {
      PrimaryColor = Colors.indigo;
      notifyListeners();
    }
  }

  chandeAppBar(index) {
    if (index == 0) {
      appBar = true;
      notifyListeners();
    }
    if (index == 1) {
      appBar = false;
      notifyListeners();
    }
  }

  isSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void searchResults(String tasck) {
    List<String> temporarySearchList = [];
    temporarySearchList.addAll(isDoneList);
    if (tasck.isNotEmpty) {
      List<String> temporaryListData = [];
      temporarySearchList.forEach((item) {
        if (item.contains(tasck)) {
          temporaryListData.add(item);
        }
      });
      searchList.clear();
      searchList.addAll(temporaryListData);
      notifyListeners();
      return;
    } else {
      searchList.clear();
      searchList.addAll(isDoneList);
      notifyListeners();
    }
  }
}
