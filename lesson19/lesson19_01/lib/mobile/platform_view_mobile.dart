import 'package:flutter/foundation.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class PlatformViewWidget extends StatelessWidget {
  //const PlatformViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final Widget view;
    if (defaultTargetPlatform == TargetPlatform.android) {
      // viewText = AndroidView(
      //   viewType: 'INTEGRATION_ANDROID_TEXT',
      //   onPlatformViewCreated: _onPlatformViewCreated,
      // );
      // final Map<String, dynamic> creationParams = <String, dynamic>{};
      // viewButton = AndroidView(
      //   viewType: 'INTEGRATION_ANDROID_BUTTON',
      //   onPlatformViewCreated: _onPlatformViewCreated,
      // );
      final String viewType = 'INTEGRATION_ANDROID';
      final Map<String, dynamic> creationParams = <String, dynamic>{};

      view = PlatformViewLink(
          surfaceFactory: (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
                controller: controller as AndroidViewController,
                hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            );
          },
          onCreatePlatformView: (PlatformViewCreationParams params) {
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
                ..addOnPlatformViewCreatedListener((params.onPlatformViewCreated))
                ..create();
          },
          viewType: viewType);

    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      // view = UiKitView(
      //   viewType: 'INTEGRATION_IOS',
      //   onPlatformViewCreated: _onPlatformViewCreated,
      // );
      view = Text('$defaultTargetPlatform is not yet supported');
    } else {
      view = Text('$defaultTargetPlatform is not yet supported');
    }

    return Column(children: [
      SizedBox(
        height: 100,
        width: 200,
        child: view,
      ),
    ]);
  }

  void _onPlatformViewCreated(int id) {
    print('Platform with id:$id created');
  }
}
