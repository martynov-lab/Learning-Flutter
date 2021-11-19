import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list/pages/profile_page.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TodoListPage extends StatefulWidget {
  static const routeName = '/todo';
  TodoListPage({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textTaskController = TextEditingController();
  TextEditingController _textDescriptionController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final todos = FirebaseFirestore.instance;
  int index = 0;

  _saveTodo() {
    todos.collection(widget.user.uid).doc("$index").set({
      'id': index,
      'title': _textTaskController.text,
      'description': _textDescriptionController.text,
      'isDone': false
    });
    setState(() {
      index++;
    });
  }

  updateTodoIsDone(String id, bool isDone) async {
    return await todos
        .collection(widget.user.uid)
        .doc(id)
        .update({'isDone': !isDone})
        .then((value) => print("Update TodoIsDone"))
        .catchError((error) => print("Failed to update TodoIsDone: $error"));
  }

  updateTodoDescription(String id, String description) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return await todos
          .collection(widget.user.uid)
          .doc(id)
          .update({'description': description}).then((value) {
        print("Updated TodoDescription");
        _formKey.currentState!.reset();
        _textDescriptionController.clear();
      }).catchError((error) {
        print("Failed to update TodoDescription: $error");
      });
    }
  }

  deleteTodo(String id) async {
    return await todos
        .collection(widget.user.uid)
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  void addTodo() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _saveTodo();
      _formKey.currentState!.reset();
      _textTaskController.clear();
    }
  }

  Widget bottomSheet(
      String hintText, TextEditingController? controller, func()) {
    return Container(
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    func();
                    Navigator.pop(context);
                  },
                  autofocus: true,
                  controller: controller,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.add),
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        func();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == "") return null;

                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomSheetDescription(String id) {
    return Container(
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    updateTodoDescription(id, _textDescriptionController.text);
                  },
                  autofocus: true,
                  controller: _textDescriptionController,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).primaryColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    hintText: "Добавить описание",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.add),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          updateTodoDescription(
                              id, _textDescriptionController.text);
                          Navigator.pop(context);
                        }),
                  ),
                  validator: (value) {
                    if (value == "") return null;

                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listTodo() {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection(widget.user.uid).snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Text('Something went wrong',
                style: TextStyle(
                    color: Colors.red[200], fontWeight: FontWeight.bold));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return new ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Checkbox(
                    value: data['isDone'],
                    onChanged: (bool? value) {
                      updateTodoIsDone("${data['id']}", data['isDone']);
                    },
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(data['title'],
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            showMaterialModalBottomSheet(
                              expand: false,
                              enableDrag: true,
                              context: context,
                              backgroundColor: Colors.white,
                              builder: (context) => bottomSheetDescription(
                                "${data['id']}",
                              ),
                            );
                          },
                        ),
                        data['description'] == '' && data['description'] == null
                            ? Text('')
                            : Text("${data['description']}",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        deleteTodo("${data['id']}");
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Todo list'),
        centerTitle: true,
      ),
      body: listTodo(),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: (widget.user.photoURL == null)
                    ? CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.green,
                        child: Text("U"),
                      )
                    : CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                            "https://img2.freepng.ru/20180410/bbw/kisspng-avatar-user-medicine-surgery-patient-avatar-5acc9f7a7cb983.0104600115233596105109.jpg"),
                        backgroundImage:
                            NetworkImage(widget.user.photoURL.toString()),
                      ),
              ),
              ListTile(
                title: Text('Profile',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                leading: Icon(Icons.person),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  if (widget.user != null)
                    Navigator.of(context).pushNamed(ProfilePage.routeName,
                        arguments: {'user': widget.user});
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 5,
          tooltip: "Добавить новую задачу",
          onPressed: () {
            showMaterialModalBottomSheet(
              expand: false,
              enableDrag: true,
              context: context,
              backgroundColor: Colors.white,
              builder: (context) =>
                  bottomSheet("Новая задача", _textTaskController, addTodo),
            );
          }),
    );
  }
}
