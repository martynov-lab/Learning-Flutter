import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

enum NotifierState { initial, loading, loaded, error }

class LocationService extends ChangeNotifier {
  bool servicestatus = false;
  bool haspermission = false;
  Position? _location;
  Position? get location => _location;
  set location(Position? items) {
    _location = items;
    notifyListeners();
  }

  String? _failure;
  String? get failure => _failure;
  void _setFailure(String message) {
    _failure = message;
    notifyListeners();
  }

  String _currentAddress = '';
  String get currentAddress => _currentAddress;
  set currentAddress(String items) {
    _currentAddress = items;
    notifyListeners();
  }

  checkGps() async {
    bool serviceEnabled = false;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    StreamSubscription<ServiceStatus> serviceStatusStream =
        Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status.name == 'enabled') {
        serviceEnabled = true;
        _failure = null;
      } else {
        serviceEnabled = false;
        _location = null;
        _setFailure(
            'Службы определения местоположения отключены! Подключите GPS');
      }
    });

    if (serviceEnabled) {
      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('В разрешениях на местоположение отказано!');
          _location = null;
          _currentAddress = '';
          _setFailure('В разрешениях на местоположение отказано!');
        } else if (permission == LocationPermission.deniedForever) {
          print(
              'Разрешения на определение местоположения запрещены на всегда!');
          _location = null;
          _currentAddress = '';
          _setFailure(
              'Разрешения на определение местоположения запрещены на всегда!');
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      _location = null;
      _currentAddress = '';
      print('Ошибка определения местоположения!');
      _setFailure('Ошибка определения местоположения!');
    }
  }

  getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _location = position;
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      if (_location != null) {
        if (position.latitude != _location!.latitude ||
            position.longitude != _location!.longitude) {
          _location = position;
        }
      }
    });
    notifyListeners();
  }

  // getAddressFromLatLng(Position pos) async {
  //   try {
  //     //if (_location != null) {
  //     List<Placemark> placemarks =
  //         await placemarkFromCoordinates(pos.latitude, pos.longitude);
  //     Placemark place = placemarks[0];
  //     _currentAddress =
  //         "${place.postalCode}, ${place.country}, ${place.locality}, ${place.street}, ${place.subThoroughfare}";
  //     //notifyListeners();
  //     //}
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
