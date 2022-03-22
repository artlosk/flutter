import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

const _currentVideoPositionWidth = 38.0;
const _minTwoDigitValue = 10;

class CurrentVideoPosition extends StatefulWidget {
  const CurrentVideoPosition({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final VideoPlayerController controller;

  @override
  State<CurrentVideoPosition> createState() => _CurrentVideoPositionState();
}

class _CurrentVideoPositionState extends State<CurrentVideoPosition> {
  int currentDurationInSecond = 0;

  @override
  void initState() {
    widget.controller.addListener(
          () => setState(() => currentDurationInSecond =
          widget.controller.value.position.inSeconds),
    );
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    width: _currentVideoPositionWidth,
    alignment: Alignment.bottomLeft,
    child: Text(
      _formatCurrentPosition(),
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
        color: Colors.white,
      ),
      maxLines: 1,
    ),
  );

  String _formatCurrentPosition() => currentDurationInSecond < _minTwoDigitValue
      ? "0 : 0$currentDurationInSecond"
      : "0 : $currentDurationInSecond";
}