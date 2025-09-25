import 'package:flutter/material.dart';
import 'dart:math';
import '../utils/app_colors.dart';

class BackgroundStars extends StatelessWidget {
  const BackgroundStars({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DoubleStarPainter(),
      child: Container(),
    );
  }
}

class DoubleStarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    const starCenterLeft = Offset(25, 10);
    const starSizeLeft = 180.0;
    _drawStar(canvas, paint, starCenterLeft, starSizeLeft, rotationAngle: -30);

    final starCenterRight = Offset(size.width + 20, 250);
    const starSizeRight = 150.0;
    _drawStar(canvas, paint, starCenterRight, starSizeRight);
  }

  void _drawStar(Canvas canvas, Paint paint, Offset center, double size,
      {double rotationAngle = 0}) {
    final path = Path();
    final outerRadius = size;
    final innerRadius = size * 0.4;
    final rotationRad = rotationAngle * pi / 180;

    for (int i = 0; i < 10; i++) {
      final angle = (i * 36.0 - 18.0) * (pi / 180.0) + rotationRad;
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
