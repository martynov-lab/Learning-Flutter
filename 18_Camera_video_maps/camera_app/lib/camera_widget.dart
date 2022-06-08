import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app/services_privider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget>
    with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  CameraController? controller;
  XFile? lastImage;

  @override
  void initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ServiceProvider>(context);
    return Stack(children: [
      controller?.value.isInitialized == true
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
              return Center(
                child: AspectRatio(
                  aspectRatio: constraints.maxWidth / constraints.maxHeight,
                  child: CameraPreview(controller!),
                ),
              );
            })
          : const SizedBox(),
      if (lastImage != null)
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              width: 120,
              height: 120,
              child: Image.file(
                File(lastImage!.path),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      Positioned(
          bottom: 40,
          right: 40,
          child: IconButton(
            icon: const Icon(
              Icons.camera,
              size: 50,
              color: Colors.white,
            ),
            onPressed: () async {
              lastImage = await controller?.takePicture();
              service.image = lastImage;
              if (service.image != null) service.addImage(service.image!);
              setState(() {});
            },
          )),
    ]);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    final CameraController cameraController = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: true,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );
    controller = cameraController;
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
  }
}
