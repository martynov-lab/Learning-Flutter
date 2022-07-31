import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PlatformView extends StatelessWidget {
  final String textFromNative;
  const PlatformView({
    Key? key,
    required this.textFromNative,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      // view = AndroidView(
      //   viewType: 'INEGRATION_ANDROID',
      //   onPlatformViewCreated: _onPlatformViewCreated,
      // );
      const String viewType = 'INEGRATION_ANDROID';
      Map<String, String> creationParams = <String, String>{
        "text": textFromNative
      };
      print('Передаваемое значение: $textFromNative');
      return PlatformViewLink(
        viewType: viewType,
        surfaceFactory: (context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          )
            ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
            ..create();
        },
      );
    }
    // else if (defaultTargetPlatform == TargetPlatform.iOS) {
    //   view = UiKitView(
    //     viewType: 'INEGRATION_ANDROID',
    //     onPlatformViewCreated: _onPlatformViewCreated,
    //   );
    // }
    else {
      view = Text('$defaultTargetPlatform is not yet supported');
    }

    return Container();
  }

  void _onPlatformViewCreated(String textFromNative) {
    print('PlatformView with text: $textFromNative created');
  }
}
