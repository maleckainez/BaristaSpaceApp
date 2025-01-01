import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class CustomScaleSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double initialValue;
  final ValueChanged<double>? onValueChanged;

  const CustomScaleSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  _CustomScaleSliderState createState() => _CustomScaleSliderState();
}


class _CustomScaleSliderState extends State<CustomScaleSlider> {
  late double currentValue;
  double sliderWidth = 0;
  double dragStartX = 0;

  @override
  void initState() {
    super.initState();
    currentValue = (widget.minValue + widget.maxValue)/2;
    widget.onValueChanged?.call(currentValue);
  }

  void _onDragStart(DragStartDetails details) {
    dragStartX = details.localPosition.dx;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final dragDelta = details.localPosition.dx - dragStartX;
    final relativeDelta = (dragDelta / sliderWidth) * 0.75; // Reduce sensitivity by 25%
    final newValue = (currentValue +
        relativeDelta * (widget.maxValue - widget.minValue))
        .clamp(widget.minValue, widget.maxValue);

    if (newValue.floor() != currentValue.floor()) {
      HapticFeedback.heavyImpact(); // Stronger haptic feedback
    }

    setState(() {
      currentValue = newValue;
      widget.onValueChanged?.call(currentValue);
    });
    dragStartX = details.localPosition.dx;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        sliderWidth = constraints.maxWidth;
        return Column(
          children: [
            SizedBox(
              width: 250,
              height: 40,
              child: GestureDetector(
                onHorizontalDragStart: _onDragStart,
                onHorizontalDragUpdate: _onDragUpdate,
                child: CustomPaint(
                  painter: ScalePainter(
                    minValue: widget.minValue,
                    maxValue: widget.maxValue,
                    currentValue: currentValue,
                  ),
                  child: Container(), // Background for interaction
                ),
              ),
            ),
            Center(
              child: Text(
                "Grind Coarseness",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class ScalePainter extends CustomPainter {
  final double minValue;
  final double maxValue;
  final double currentValue;

  ScalePainter({
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
  });

  final blackPaint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    final tickCount = 20; // Number of ticks
    final tickSpacing = size.width / tickCount;

    for (int i = 0; i <= tickCount; i++) {
      final x = i * tickSpacing;
      final isMajorTick = i % 5 == 0;

      canvas.drawLine(
        Offset(x, 0),
        Offset(x, isMajorTick ? 20 : 10), // Longer lines for major ticks
        isMajorTick ? blackPaint : paint,
      );
    }

    // Drawing the red line
    final redLineX = ((currentValue - minValue) / (maxValue - minValue)) *
        size.width; // Red line position
    final redPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(redLineX, 0),
      Offset(redLineX, 30),
      redPaint,
    );

    // Drawing circles for Fine and Coarse
    final circleRadius = 10.0;
    final fineCirclePaint = Paint()..color = Colors.black;
    final coarseCirclePaint = Paint()..color = Colors.black;

    // Fine grind circle (left side) with small dots
    canvas.drawCircle(
      Offset(-25, 10),
      circleRadius,
      fineCirclePaint,
    );
    // Coarse grind circle (right side) with bigger circles
    canvas.drawCircle(
      Offset(size.width + 25, 10),
      circleRadius,
      coarseCirclePaint,
    );
    final bigCirclePaint = Paint()..color = Colors.white;
    canvas.drawCircle(
      Offset(-25, 10),
      9.0,
      bigCirclePaint,
    );
    canvas.drawCircle(
        Offset(size.width + 25, 10),
        9.0,
        bigCirclePaint,
    );
    for (int i = -31; i <= -19; i += 4) {
      canvas.drawCircle(Offset(i.toDouble(), 10), 1, fineCirclePaint);
    }
    for (int i = -29; i <= -21; i += 4) {
      canvas.drawCircle(Offset(i.toDouble(), 13), 1, fineCirclePaint);
    }
    for (int i = -27; i <= -23; i += 4) {
      canvas.drawCircle(Offset(i.toDouble(), 16), 1, fineCirclePaint);
    }
    for (int i = -27; i <= -23; i += 4) {
      canvas.drawCircle(Offset(i.toDouble(), 4), 1, fineCirclePaint);
    }
    for (int i = -29; i <= -21; i += 4) {
      canvas.drawCircle(Offset(i.toDouble(), 7), 1, fineCirclePaint);
    }
    for (int i = 19; i <= 31; i += 6) {
      canvas.drawCircle(Offset(size.width + i.toDouble(), 10), 2, fineCirclePaint);
    }
    for (int i = 22; i <= 28; i += 6) {
      canvas.drawCircle(Offset(size.width + i.toDouble(), 15), 2, fineCirclePaint);
    }
    for (int i = 22; i <= 28; i += 6) {
      canvas.drawCircle(Offset(size.width + i.toDouble(), 5), 2, fineCirclePaint);
    }




  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
