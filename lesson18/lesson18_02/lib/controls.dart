import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({Key? key, required this.controller, required this.animationController}) : super(key: key);

  final VideoPlayerController controller;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Duration currentPosition =
                          controller.value.position;
                      Duration targetPosition =
                          currentPosition - const Duration(seconds: 10);
                      controller.seekTo(targetPosition);
                    },
                    color: Colors.white,
                    iconSize: 50.0,
                    icon: const Icon(Icons.replay_10),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.play();
                      animationController.forward();
                      // controller.value.isPlaying
                      //     ? controller.pause()
                      //     : controller.play();
                    },
                    color: Colors.white,
                    iconSize: 100.0,
                    icon: const Icon(Icons.play_circle_fill),
                  ),
                  IconButton(
                    onPressed: () {
                      Duration currentPosition =
                          controller.value.position;
                      Duration targetPosition =
                          currentPosition + const Duration(seconds: 10);
                      controller.seekTo(targetPosition);
                    },
                    color: Colors.white,
                    iconSize: 50.0,
                    icon: const Icon(Icons.forward_10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}