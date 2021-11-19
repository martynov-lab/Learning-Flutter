import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_list/pages/authorization_page.dart';
import 'package:flutter_todo_list/pages/todo_list.dart';
import 'package:flutter_todo_list/services/authorization_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';

  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AthorizationService _authService = AthorizationService();
  User? _currentUser;
  File? _image;
  String? photoURL;
  String? name;
  String? email;
  bool emailVerified = false;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  saveImage() async {
    User? user = await _authService.getCurrentUser();
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('users/${user!.uid}/avatar.jpg');
    UploadTask uploadTask = ref.putFile(_image!);
    var imageUrl = await (await uploadTask).ref.getDownloadURL();
    String url = imageUrl.toString();
    User? updateUser = await _authService.updateUserPhoto(url);
    setState(() {
      _currentUser = updateUser;
    });

    Navigator.pop(context);
  }

  getUser() async {
    var _user = await _authService.getCurrentUser();
    setState(() {
      _currentUser = _user;
      photoURL = _currentUser!.photoURL;
      name = _currentUser!.displayName;
      email = _currentUser!.email;
      emailVerified = _currentUser!.emailVerified;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: _image == null
                ? Icon(
                    Icons.image_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 200,
                  )
                : Image.file(_image!),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: getImage, child: Text('Загрузить фото')),
              ElevatedButton(
                  onPressed: saveImage, child: Text('Сохранить фото')),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              User? user = await AthorizationService.refreshUser(_currentUser!);
              if (user != null) {
                setState(() {
                  _currentUser = user;
                });
              }
            },
          )
        ],
        title: Text("Profile"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: (photoURL == null)
                    ? CircleAvatar(
                        radius: 50,
                        foregroundColor: Colors.amber,
                        backgroundColor: Colors.green,
                        child: Text("U"),
                      )
                    : CircleAvatar(
                        radius: 50,
                        foregroundImage: NetworkImage(
                            "https://img2.freepng.ru/20180410/bbw/kisspng-avatar-user-medicine-surgery-patient-avatar-5acc9f7a7cb983.0104600115233596105109.jpg"),
                        backgroundImage:
                            NetworkImage(_currentUser!.photoURL.toString()),
                      ),
              ),
              ListTile(
                title: Text('Todo list',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                leading: Icon(
                  Icons.check_box_outlined,
                ),
                trailing: Icon(Icons.navigate_next),
                onTap: () {
                  if (_currentUser != null)
                    Navigator.of(context).pushNamed(TodoListPage.routeName,
                        arguments: {'user': _currentUser});
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: (photoURL) != null
                      ? GestureDetector(
                          child: Image.network((photoURL).toString(),
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                            return Text("Аватарка не задана");
                          }, fit: BoxFit.contain),
                          onTap: () => showMaterialModalBottomSheet(
                            expand: false,
                            enableDrag: true,
                            context: context,
                            backgroundColor: Colors.white,
                            builder: (context) => _bottomSheet(),
                          ),
                        )
                      : GestureDetector(
                          child: Icon(
                            Icons.image,
                            color: Colors.white54,
                            size: 200,
                          ),
                          onTap: () => showMaterialModalBottomSheet(
                            expand: false,
                            enableDrag: true,
                            context: context,
                            backgroundColor: Colors.white,
                            builder: (context) => _bottomSheet(),
                          ),
                        ),
                ),
                Divider(
                  height: 1,
                  color: Colors.white,
                ),
                SizedBox(height: 20.0),
                Text(
                  'NAME: $name',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 20.0),
                Text(
                  'EMAIL: $email',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 20.0),
                emailVerified
                    ? Text(
                        'Email verified',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.green),
                      )
                    : Column(
                        children: [
                          Text(
                            'Email not verified',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.red),
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              await _currentUser!.sendEmailVerification();
                            },
                            child: Text('Verify email'),
                          ),
                        ],
                      ),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context)
                          .pushNamed(AuthorizationPage.routeName);
                    },
                    child: Text('Выход'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
