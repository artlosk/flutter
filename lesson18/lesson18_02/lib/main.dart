import 'package:flutter/material.dart';
import 'package:lesson18_02/position.dart';
import 'package:lesson18_02/total_time.dart';
import 'package:video_player/video_player.dart';

import 'controls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Video player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  late AnimationController controllerAnimate;
  late Animation<double> animation;

  double sliderValue = 0;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1920_18MG.mp4');

    _controller.addListener(() {
      setState(() {});
    });

    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {
          controllerAnimate = AnimationController(
            vsync: this,
            duration: Duration(
                milliseconds: _controller.value.duration.inMilliseconds),
          );

          animation = Tween(
                  begin: 0.0,
                  end: _controller.value.duration.inMilliseconds.toDouble())
              .animate(controllerAnimate);

          controllerAnimate.forward();

          controllerAnimate.addListener(() {
            setState(() {});
          });
        }));
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    controllerAnimate.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: !_controller.value.isInitialized
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    GestureDetector(
                      child: VideoPlayer(_controller),
                      onTap: () {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                          controllerAnimate.stop();
                        }
                      },
                    ),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                    ControlsOverlay(
                      controller: _controller,
                      animationController: controllerAnimate,
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          sliderValue = _controller
                              .value.position.inMilliseconds
                              .toDouble();
                          return Slider(
                            min: 0,
                            max: _controller.value.duration.inMilliseconds
                                .toDouble(),
                            value: sliderValue,
                            onChanged: (value) {
                              setState(() {
                                sliderValue = value;
                              });
                              _controller.seekTo(
                                  Duration(milliseconds: value.toInt()));
                            },
                          );
                        },
                      ),
                    ),
                    Positioned(
                      child: CurrentVideoPosition(controller: _controller),
                      left: 10,
                      bottom: 10,
                    ),
                    Positioned(
                      child: TotalTime(controller: _controller),
                      right: 10,
                      bottom: 10,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
