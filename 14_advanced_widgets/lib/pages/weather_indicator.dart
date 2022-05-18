import 'package:flutter/material.dart';
import 'dart:math' as math;

class WeatherIndicator extends StatelessWidget {
  final double opacityVisible;

  const WeatherIndicator({Key? key, required this.opacityVisible})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _getSunOpacity(double value) {
      if (value > 0.6) {
        return 0;
      }
      return -10 / 6 * value + 1;
    }

    double _getCloudOpacity(double value) {
      if (value < 0.1) {
        return 0;
      }
      if (value > 0.7) {
        return 1;
      }
      return 10 / 6 * value - 1 / 6;
    }

    double _getThunderCloudOpacity(double value) {
      if (value < 0.7) {
        return 0;
      }
      return 10 / 3 * value - 7 / 3;
    }

    double _getDropsOpacity(double value) {
      if (value < 0.7) {
        return 0;
      }
      return 10 / 3 * value - 7 / 3;
    }

    // print('Opacity Cloud: ${_getCloudOpacity(opacityVisible)}');
    // print('Opacity Thunder Cloud: ${_getThunderCloudOpacity(opacityVisible)}');
    return Stack(
      children: [
        Opacity(
          opacity: _getSunOpacity(opacityVisible),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: Paint1(),
            ),
          ),
        ),
        Opacity(
          opacity: _getCloudOpacity(opacityVisible),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: Paint2(),
            ),
          ),
        ),
        Opacity(
          opacity: _getThunderCloudOpacity(opacityVisible),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: Paint3(),
            ),
          ),
        ),
        Opacity(
          opacity: _getDropsOpacity(opacityVisible),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: Paint4(),
            ),
          ),
        ),
      ],
    );
  }
}

double _degreeToRadians(num degree) {
  return (degree * math.pi) / 180.0;
}

class Paint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter1 = Paint()
      ..color = Colors.yellow.shade300
      ..style = PaintingStyle.fill;

    //солнце
    var path1 = Path();
    path1.addOval(Rect.fromCircle(
      center: Offset(size.width * .35, size.height * .25),
      radius: size.width * .3,
    ));
    canvas.drawPath(path1, painter1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Paint2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter2 = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.fill;

    //облако
    var path2 = Path()
      ..moveTo(size.width * .1, size.height * .65)
      ..arcToPoint(
        Offset(
          size.width * .1,
          size.height * .45,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .05),
      )
      ..quadraticBezierTo(
        size.width * .2,
        size.height * .2,
        size.width * .5,
        size.height * .3,
      )
      ..arcToPoint(
        Offset(
          size.width * .9,
          size.height * .45,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .03),
      )
      ..arcToPoint(
        Offset(
          size.width * .9,
          size.height * .65,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .03),
      )
      ..close();

    canvas.drawPath(path2, painter2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Paint3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter3 = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.fill;

    //облако
    var path2 = Path()
      ..moveTo(size.width * .1, size.height * .65)
      ..arcToPoint(
        Offset(
          size.width * .1,
          size.height * .45,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .05),
      )
      ..quadraticBezierTo(
        size.width * .2,
        size.height * .2,
        size.width * .5,
        size.height * .3,
      )
      ..arcToPoint(
        Offset(
          size.width * .9,
          size.height * .45,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .03),
      )
      ..arcToPoint(
        Offset(
          size.width * .9,
          size.height * .65,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .03),
      )
      ..close();

    canvas.drawPath(path2, painter3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Paint4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter4 = Paint()
      ..color = Colors.blue.shade500
      ..style = PaintingStyle.fill;

    //капли
    var path3 = Path()
      ..moveTo(size.width * .8, size.height * .7)
      ..lineTo(
        size.width * .8,
        size.height * .75,
      )
      ..arcToPoint(
        Offset(
          size.width * .78,
          size.height * .745,
        ),
        clockwise: true,
        radius: Radius.circular(size.height * .002),
      );

    path3.addPath(path3, Offset(size.width * .1, size.height * .1));
    path3.addPath(path3, Offset(size.width * -.1, size.height * .1));
    path3.addPath(path3, Offset(size.width * -.2, 0));
    path3.addPath(path3, Offset(size.width * -.4, 0));
    canvas.drawPath(path3, painter4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
