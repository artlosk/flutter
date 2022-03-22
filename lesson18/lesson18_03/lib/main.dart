import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  GoogleMapController? _controller;
  double sliderValue = 14.4746;

  static const CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(42.8155759, 74.6347992), zoom: 14.4746);

  @override
  void initState() {
    super.initState();
    //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (controller) {
              _controller = controller;
            },
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  _controller?.animateCamera(
                    CameraUpdate.scrollBy(0.0, -50.0),
                  );
                },
                color: Colors.white,
                iconSize: 40,
                icon: const Icon(Icons.keyboard_arrow_up),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: IconButton(
                      onPressed: () {
                        _controller?.animateCamera(
                          CameraUpdate.scrollBy(-50.0, 0.0),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _controller?.animateCamera(
                          CameraUpdate.newCameraPosition(_kGooglePlex));
                    },
                    color: Colors.white,
                    iconSize: 40,
                    icon: const Icon(Icons.place_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      onPressed: () {
                        _controller?.animateCamera(
                          CameraUpdate.scrollBy(50.0, 0.0),
                        );
                      },
                      color: Colors.white,
                      iconSize: 40,
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  _controller?.animateCamera(
                    CameraUpdate.scrollBy(0.0, 50.0),
                  );
                },
                color: Colors.white,
                iconSize: 40,
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white.withOpacity(0.8),
                width: 200,
                height: 40,
                child: Slider(
                  max: 50.0,
                  min: 1.0,
                  value: sliderValue,
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                    _controller?.animateCamera(CameraUpdate.zoomTo(value));
                  },
                ),
              ),
            ),
          ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
