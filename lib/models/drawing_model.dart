import 'package:flutter/material.dart';

class DrawingModel extends ChangeNotifier {
  List<Offset?> _points = [];
  Color _color = Colors.black;
  double _strokeWidth = 3.0;

  List<Offset?> get points => _points;
  Color get color => _color;
  double get strokeWidth => _strokeWidth;

  void addPoint(Offset? point) {
    _points = [..._points, point];
    notifyListeners();
  }

  void setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  void setStrokeWidth(double width) {
    _strokeWidth = width;
    notifyListeners();
  }

  void clearPoints() {
    _points = [];
    notifyListeners();
  }
}