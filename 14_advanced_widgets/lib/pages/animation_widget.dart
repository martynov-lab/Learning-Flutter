import 'package:advanced_widgets/pages/weather_indicator.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationWidget extends StatefulWidget {
  final double opacityVisible;
  final bool isShowAnimation;
  const AnimationWidget(
      {Key? key, required this.opacityVisible, required this.isShowAnimation})
      : super(key: key);

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  late Animation<double> moveDown;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));
    scale = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
          parent: controller, curve: Curves.easeInSine /*easeInOutBack*/),
    );
    moveDown = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.stop();
      }
      // if (controller.status == AnimationStatus.dismissed) {
      //   controller.reverse();
      // }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Показывать анимацию: ${widget.isShowAnimation}');
    widget.isShowAnimation ? controller.forward() : controller.reverse();
    //controller.repeat();
    return AnimatedBuilder(
        animation: controller,
        child: WeatherIndicator(opacityVisible: widget.opacityVisible),
        builder: (context, childWidget) {
          return Transform.translate(
            offset: Offset(0.0, moveDown.value),
            child: Transform.scale(
              scale: scale.value,
              child: childWidget,
            ),
          );
        });
  }
}
