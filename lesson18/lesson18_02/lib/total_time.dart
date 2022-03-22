import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const _minTwoDigitValue = 10;

class TotalTime extends StatelessWidget {
  const TotalTime({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) => Container(
    alignment: Alignment.bottomLeft,
    child: Text(
      _formatCurrentPosition(),
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
        color: Colors.white,
      ),
      maxLines: 1,
    ),
  );

  String _formatCurrentPosition() => controller.value.duration.inSeconds < _minTwoDigitValue
      ? "0 : 0${controller.value.duration.inSeconds}"
      : "0 : ${controller.value.duration.inSeconds}";
}
