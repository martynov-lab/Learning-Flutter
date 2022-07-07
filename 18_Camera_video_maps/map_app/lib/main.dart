import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:map_app/location_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LocationService>(
            create: (context) =>
                LocationService()..checkGps() /*..determinePosition()*/),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YandexMapController controller;
  double sliderValue = 15.0;

  final List<MapObject> mapObjects = [];

  final MapObjectId targetMapObjectId = const MapObjectId('target_placemark');
  late Point _point = const Point(latitude: 59.945933, longitude: 30.320045);
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  bool tiltGesturesEnabled = true;
  bool zoomGesturesEnabled = true;
  bool rotateGesturesEnabled = true;
  bool scrollGesturesEnabled = true;
  bool modelsEnabled = true;
  bool nightModeEnabled = false;
  bool fastTapEnabled = false;
  bool mode2DEnabled = false;
  bool indoorEnabled = false;
  bool liteModeEnabled = false;
  ScreenRect? focusRect;
  MapType mapType = MapType.vector;
  int? poiLimit;

  final String style = '''
    [
      {
        "tags": {
          "all": ["landscape"]
        },
        "stylers": {
          "color": "f00",
          "saturation": 0.5,
          "lightness": 0.5
        }
      }
    ]
  ''';

  String _enabledText(bool enabled) {
    return enabled ? 'on' : 'off';
  }

  MapType _nextMapType(MapType oldMapType) {
    switch (oldMapType) {
      case MapType.map:
        return MapType.hybrid;
      case MapType.hybrid:
        return MapType.satellite;
      case MapType.satellite:
        return MapType.vector;
      case MapType.vector:
        return MapType.none;
      case MapType.none:
        return MapType.map;
      default:
        return MapType.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    var locationService = Provider.of<LocationService>(context);
    locationService.checkGps();
    var loc = locationService.location;
    if (loc != null) {
      _point = Point(latitude: loc.latitude, longitude: loc.longitude);
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidYandexMap.useAndroidViewSurface = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            YandexMap(
              mapType: mapType,
              poiLimit: poiLimit,
              tiltGesturesEnabled: tiltGesturesEnabled,
              zoomGesturesEnabled: zoomGesturesEnabled,
              rotateGesturesEnabled: rotateGesturesEnabled,
              scrollGesturesEnabled: scrollGesturesEnabled,
              modelsEnabled: modelsEnabled,
              nightModeEnabled: nightModeEnabled,
              fastTapEnabled: fastTapEnabled,
              mode2DEnabled: mode2DEnabled,
              indoorEnabled: indoorEnabled,
              liteModeEnabled: liteModeEnabled,
              logoAlignment: const MapAlignment(
                  horizontal: HorizontalAlignment.left,
                  vertical: VerticalAlignment.bottom),
              focusRect: focusRect,
              mapObjects: mapObjects,
              onMapCreated: (YandexMapController yandexMapController) async {
                controller = yandexMapController;
                await controller.moveCamera(
                    CameraUpdate.newCameraPosition(
                        CameraPosition(target: _point, zoom: sliderValue)),
                    animation: animation);
                final cameraPosition = await controller.getCameraPosition();
                final minZoom = await controller.getMinZoom();
                final maxZoom = await controller.getMaxZoom();

                print('Camera position: $cameraPosition');
                print('Min zoom: $minZoom, Max zoom: $maxZoom');
              },
              onMapTap: (Point point) async {
                print('Tapped map at $point');

                await controller.deselectGeoObject();
              },
              onMapLongTap: (Point point) => print('Long tapped map at $point'),
              onCameraPositionChanged: (CameraPosition cameraPosition,
                  CameraUpdateReason reason, bool finished) {
                print('Camera position: $cameraPosition, Reason: $reason');

                if (finished) {
                  print('Camera position movement has been finished');
                }
              },
              onObjectTap: (GeoObject geoObject) async {
                print('Tapped object: ${geoObject.name}');

                if (geoObject.selectionMetadata != null) {
                  await controller.selectGeoObject(
                      geoObject.selectionMetadata!.id,
                      geoObject.selectionMetadata!.layerId);
                }
              },
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.add,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () async {
                            await controller.moveCamera(CameraUpdate.zoomIn(),
                                animation: animation);
                            setState(() {
                              sliderValue > 0 && sliderValue < 20
                                  ? sliderValue++
                                  : sliderValue;
                            });
                          },
                        ),
                        SizedBox(
                          width: 50,
                          height: 200,
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: Slider(
                              value: sliderValue,
                              max: 20.0,
                              min: 1.0,
                              onChanged: (value) async {
                                setState(() {
                                  sliderValue = value;
                                });
                                await controller.moveCamera(
                                    CameraUpdate.zoomTo(value),
                                    animation: animation);
                              },
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () async {
                            await controller.moveCamera(CameraUpdate.zoomOut(),
                                animation: animation);
                            setState(() {
                              sliderValue > 0 && sliderValue < 20
                                  ? sliderValue--
                                  : sliderValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: Container(
            //         width: 50,
            //         height: 200,
            //         decoration: BoxDecoration(
            //           color: Colors.white.withOpacity(0.8),
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Transform(
            //           alignment: FractionalOffset.center,
            //           transform: Matrix4.identity()
            //             ..rotateZ(90 * 3.1415927 / 180),
            //           child: Slider(
            //             value: sliderValue,
            //             max: 50.0,
            //             min: 1.0,
            //             onChanged: (value) async {
            //               setState(() {
            //                 sliderValue = value;
            //               });
            //               await controller.moveCamera(
            //                   CameraUpdate.zoomTo(value),
            //                   animation: animation);
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.compass_fill,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () async {
                            await controller.moveCamera(
                                CameraUpdate.azimuthTo(1),
                                animation: animation);
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                            size: 30,
                          ),
                          onPressed: () async {
                            await controller.moveCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: _point, zoom: sliderValue)),
                                animation: animation);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
