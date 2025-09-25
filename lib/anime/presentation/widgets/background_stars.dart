import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/app_colors.dart';

class BackgroundStar extends StatelessWidget {
  const BackgroundStar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SingleStarPainter(),
      child: Container(),
    );
  }
}

class SingleStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final starCenter = Offset(size.width * 0.9, size.height * 0.2);
    const starSize = 220.0;

    _drawStar(canvas, paint, starCenter, starSize);
  }

  void _drawStar(Canvas canvas, Paint paint, Offset center, double size) {
    final path = Path();
    final outerRadius = size;
    final innerRadius = size * 0.4;

    for (int i = 0; i < 10; i++) {
      final angle = (i * 36.0 - 18.0) * (pi / 180.0);
      final radius = i.isEven ? outerRadius : innerRadius;
      final x = center.dx + cos(angle) * radius;
      final y = center.dy + sin(angle) * radius;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
