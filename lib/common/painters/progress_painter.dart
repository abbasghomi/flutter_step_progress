import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final bool drawLeadingLine;
  final double animationValue;
  final String title;

  ProgressPainter(this.drawLeadingLine, this.animationValue, this.title);

  @override
  void paint(Canvas canvas, Size size) {
    var paintCheckMark = Paint();
    paintCheckMark.color =
        Color.fromARGB((animationValue * 255.0).toInt(), 100, 100, 100);
    paintCheckMark.strokeWidth = 2;
    paintCheckMark.style = PaintingStyle.stroke;

    var lineBackPaint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.butt;
    var circleBackPaint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.butt;

    var linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.butt;
    var circlePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.butt;

    double iconSize = 20.0;

    Offset startingPoint = Offset(0, size.height / 2);
    Offset endingPointFixed = Offset(size.width - (iconSize), size.height / 2);
    Offset endingPoint =
        Offset((size.width - (iconSize / 2)) * animationValue, size.height / 2);

    if (drawLeadingLine) {
      canvas.drawLine(startingPoint, endingPointFixed, lineBackPaint);
    }
    var circleCenter = Offset(size.width - (iconSize / 2), size.height / 2);

    canvas.drawCircle(circleCenter, iconSize / 1.5, circleBackPaint);

    if (drawLeadingLine && animationValue > 0) {
      canvas.drawLine(startingPoint, endingPoint, linePaint);
    }

    canvas.drawCircle(circleCenter,
        (iconSize / 2) * (drawLeadingLine ? animationValue : 1.0), circlePaint);

    var checkMarkPath = Path();
    checkMarkPath.moveTo((size.width - iconSize + 5), (size.height / 2));
    checkMarkPath.lineTo(
        (size.width - iconSize / 2), (size.height / 2) + (iconSize / 6));
    checkMarkPath.lineTo((size.width - 5), (size.height / 2) - (iconSize / 4));

    canvas.drawPath(checkMarkPath, paintCheckMark);

    Offset textPoint =
        Offset(size.width - iconSize * 1.5, (size.height / 2) + iconSize / 1.2);
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: title,
      style: TextStyle(
        color: Color.fromARGB((animationValue * 255.0).toInt(), 255, 255, 255),
        fontSize: 14.0,
      ),
    );
    textPainter.layout();
    textPainter.paint(canvas, textPoint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
