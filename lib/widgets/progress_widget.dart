import 'package:flutter/material.dart';
import 'package:flutter_step_progress/common/controllers/progress_controller.dart';
import 'package:flutter_step_progress/common/painters/progress_painter.dart';

class ProgressWidget extends StatefulWidget {
  final ProgressController? controller;
  final bool drawLeadingLine;
  final String title;

  const ProgressWidget(
      {Key? key, this.controller, this.title = '', this.drawLeadingLine = true})
      : super(key: key);

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation growAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addListener(() {
            setState(() {});
            print('GrowAnimation value: ${growAnimation.value}');
          });

    growAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    widget.controller!.startAnimation = startAnimation;
    widget.controller!.resetAnimation = resetAnimation;
  }

  void startAnimation() {
    controller.forward();
  }

  void resetAnimation() {
    controller.value = 0;
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ProgressPainter(
          widget.drawLeadingLine, controller.value, widget.title),
      child: Container(),
    );
  }
}
