import 'dart:math';
import 'package:flutter/cupertino.dart';

class PieChart extends CustomPainter {
  PieChart({@required this.categories, @required this.width});

  final List<Category> categories;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

// double dots are used as a cascade notation, other ways to represent the same
// paint.style = PaintingStyle.stroke;
// paint.strokeWidth = width / 2;
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 2;

    double total = 0;
    categories.forEach((reading) => total += reading.value);

    double startRadian = -pi / 2;

    for (var index = 0; index < categories.length; index++) {
      final currentCategory = categories.elementAt(index);
      final sweepRadian = currentCategory.value / total * 2 * pi;
      paint.color = kNeomorphicColors.elementAt(index % categories.length);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startRadian,
        sweepRadian,
        false,
        paint,
      );

      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Category {
  Category(this.name, {@required this.value});

  final String name;
  final double value;
}

final kCategories = [
  Category('temperature', value: 37.40),
  Category('humidity', value: 57.22),
  // Category('temperature', value: 226.22),
  // Category('humidity', value: 826.22),
  // Category('temperature', value: 1132.40),
  // Category('humidity', value: 826.22),
  // Category('temperature', value: 1132.40),
  // Category('humidity', value: 826.22),
];

final kNeomorphicColors = [
  Color.fromRGBO(157, 223, 211, 1),
  Color.fromRGBO(38, 42, 170, 0.5),
  // Color.fromRGBO(123, 201, 82, 1),
  // Color.fromRGBO(252, 91, 57, 1),
  // Color.fromRGBO(123, 201, 82, 1),
  // Color.fromRGBO(252, 91, 57, 1),
  // Color.fromRGBO(123, 201, 82, 1),
  // Color.fromRGBO(252, 91, 57, 1),
];
