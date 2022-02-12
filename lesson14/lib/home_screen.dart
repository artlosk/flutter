import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lesson14/themes.dart';
import 'package:lesson14/weather_indicator.dart';
import 'custom_theme.dart';

class HomeScreen extends StatefulWidget {
  final double globalSize;
  const HomeScreen({Key? key, required this.globalSize}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool isSwitched = false;

  late final AnimationController _controller1;
  late final Animation<double> _animation1;
  late final Animation<double> _animation2;

  late double opacity = 1;
  late double size;
  late bool indicatorCounter = true;
  late bool visibleDescription = false;
  bool click = false;

  Map<double, String> textState = {
    0.0: '20 градусов,\n Ясно',
    0.1: '18 градусов,\n Ясно',
    0.2: '17 градусов,\n Ясно',
    0.3: '16 градусов,\n Временами облачно',
    0.4: '15 градусов,\n Временами облачно',
    0.5: '14 градусов,\n Временами облачно',
    0.6: '15 градусов,\n Облачно',
    0.7: '14 градусов,\n Облачно, возможны дожди',
    0.8: '14 градусов,\n Облачно, временами дожди',
    0.9: '14 градусов,\n Дожди',
    1.0: '14 градусов,\n Дожди',
  };

  @override
  void initState() {
    size = widget.globalSize;
    _controller1 = AnimationController(
        duration: const Duration(milliseconds: 5000),
        vsync: this,
        animationBehavior: AnimationBehavior.preserve);
    _animation1 = Tween<double>(begin: 100, end: size).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: const Interval(0.0, 0.1, curve: Curves.ease),
      ),
    )..addListener(() {
        setState(() {
          size = _animation1.value;
        });
      });

    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: const Interval(0.1, 0.9, curve: Curves.easeInOut),
      ),
    )..addListener(() {
        setState(() {
          opacity = _animation2.value;
        });
      });

    _animation2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller1.reverse(from: 0.1);
        setState(() {
          indicatorCounter = false;
          click = true;
        });
      }
    });

    _controller1.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          size = widget.globalSize / 4;
          Random r = Random();
          double randomValue = 0.0 + (1.0 - 0.0) * r.nextDouble();
          opacity = double.parse(randomValue.toStringAsFixed(1));
        });
      }
    });

    _controller1.forward().orCancel;

    super.initState();
  }

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  double randomDouble() {
    double rnd = Random().nextDouble();
    return double.parse(rnd.toStringAsFixed(2));
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Weather"),
        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                _changeTheme(
                    context, isSwitched ? MyThemeKeys.Night : MyThemeKeys.Day);
              });
            },
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller1,
        builder: (context, child) {
          return GestureDetector(
            child: WeatherIndicator(
                key: UniqueKey(),
                opacity: opacity,
                size: size,
                indicatorText: indicatorCounter,
                weatherText:
                    visibleDescription ? (textState[opacity] ?? '') : ''),
            onTap: () {
              if (click) {
                setState(() {
                  size = size == widget.globalSize ? widget.globalSize / 4 : widget.globalSize;
                  visibleDescription =
                      visibleDescription == true ? false : true;
                });
              }
            },
          );
        },
      ),
    );
  }
}
