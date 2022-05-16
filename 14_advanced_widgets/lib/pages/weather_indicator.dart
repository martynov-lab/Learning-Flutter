import 'package:flutter/material.dart';

class WeatherIndicator extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final painter1 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    final painter2 = Paint()
      ..color = Colors.grey.shade300 //.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final painter3 = Paint()
      ..color = Colors.grey.shade800 //.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final painter4 = Paint()
      ..color = Colors.blue.shade500
      ..style = PaintingStyle.fill;

    var path1 = Path();
    path1.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 50,
    ));
    canvas.drawPath(path1, painter1);

    var path2 = Path();
    path2.addOval(Rect.fromCircle(
      center: Offset(size.width * 2, size.height / 2),
      radius: 25,
    ));
    canvas.drawPath(path2, painter2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
