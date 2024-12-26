import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For haptic feedback

class CustomScaleSlider extends StatefulWidget {
  final double minValue;
  final double maxValue;
  final double initialValue;

  const CustomScaleSlider({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
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
    currentValue = widget.initialValue;
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
              height: 25,
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
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Fine",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    "Coarse",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
