import 'package:flutter/material.dart';
import 'package:drawing_board/models/drawing_model.dart';
import 'package:provider/provider.dart';

class DrawingCanvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        RenderBox? box = context.findRenderObject() as RenderBox;
        Offset point = box.globalToLocal(details.globalPosition);
        Provider.of<DrawingModel>(context, listen: false).addPoint(point);
      },
      onPanStart: (details) {
        RenderBox? box = context.findRenderObject() as RenderBox;
        Offset point = box.globalToLocal(details.globalPosition);
        Provider.of<DrawingModel>(context, listen: false).addPoint(point);
      },
      onPanEnd: (details) {
        Provider.of<DrawingModel>(context, listen: false).addPoint(null);
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: DrawingPainter(Provider.of<DrawingModel>(context).points, Provider.of<DrawingModel>(context).color, Provider.of<DrawingModel>(context).strokeWidth),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double strokeWidth;

  DrawingPainter(this.points, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}