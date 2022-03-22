import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:lesson18_01/camera.dart';
import 'package:lesson18_01/tab_item.dart';

class Camera extends StatefulWidget {
  Camera({Key? key, required this.gallery}) : super(key: key);

  List<XFile> gallery;

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> with WidgetsBindingObserver {
  late List<CameraDescription> camera;
  CameraController? controller;
  XFile? lastImage;

  //List<XFile> gallery = [];

  @override
  void initState() {
    super.initState();
    unawaited(initCamera());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _onNewCameraSelected(cameraController.description);
    }

    super.didChangeAppLifecycleState(state);
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    await controller!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller?.value.isInitialized == true
            ? Container(
                width: double.infinity,
                child: CameraPreview(controller!),
              )
            : const SizedBox(),
        if (lastImage != null)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
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
        Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            iconSize: 48.0,
            onPressed: () async {
              lastImage = await controller?.takePicture();
              setState(() {
                widget.gallery.insert(0, lastImage!);
              });
            },
            icon: const Icon(Icons.camera),
          ),
        )
      ],
    );
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
        imageFormatGroup: ImageFormatGroup.jpeg);

    controller = cameraController;

    cameraController.addListener(() {
      if (mounted) setState(() {});
    });
  }
}
