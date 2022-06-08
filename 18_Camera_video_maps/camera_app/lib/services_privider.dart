import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class ServiceProvider with ChangeNotifier {
  XFile? _image;
  XFile? get image => _image;

  set image(XFile? items) {
    _image = items;
    notifyListeners();
  }

  List<XFile> _listImage = [];
  List<XFile> get listImage => _listImage;

  addImage(XFile image) {
    _listImage.add(image);
    notifyListeners();
  }
}
