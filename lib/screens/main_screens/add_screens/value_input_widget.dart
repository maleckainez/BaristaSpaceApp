import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdvancedSpinBox extends StatefulWidget {
  final double initialValue;
  final double min;
  final double max;
  final double step;
  final double acceleration;
  final String unit;
  final ValueChanged<double>? onChanged;

  const AdvancedSpinBox({
    Key? key,
    this.initialValue = 0,
    this.min = 0,
    this.max = 100,
    this.step = 1,
    this.acceleration = 5,
    this.unit = '',
    this.onChanged,
  }) : super(key: key);

  @override
  _AdvancedSpinBoxState createState() => _AdvancedSpinBoxState();
}

class _AdvancedSpinBoxState extends State<AdvancedSpinBox> {
  late double _currentValue;
  late TextEditingController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _controller = TextEditingController(text: '${_currentValue.toStringAsFixed(1)} ${widget.unit}');
    widget.onChanged?.call(_currentValue);
  }

  void _updateValue(double newValue) {
    if (newValue >= widget.min && newValue <= widget.max) {
      setState(() {
        _currentValue = newValue;
        _controller.text = '${_currentValue.toStringAsFixed(1)} ${widget.unit}';
        widget.onChanged?.call(_currentValue);
      });
    }
  }

  void _increment() {
    _updateValue(_currentValue + widget.step);
  }

  void _decrement() {
    _updateValue(_currentValue - widget.step);
  }

  void _startLongPress(bool increment) {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (increment) {
        _updateValue(_currentValue + widget.acceleration);
      } else {
        _updateValue(_currentValue - widget.acceleration);
      }
    });
  }

  void _stopLongPress() {
    _timer?.cancel();
    _timer = null;
  }

  void _onSubmitted(String value) {
    final parsedValue = double.tryParse(value.replaceAll(widget.unit, '').trim());
    if (parsedValue != null) {
      if (parsedValue >= widget.min && parsedValue <= widget.max) {
        setState(() {
          _currentValue = parsedValue;
          _controller.text = '${_currentValue.toStringAsFixed(1)} ${widget.unit}';
          widget.onChanged?.call(_currentValue); // Wywołanie onChanged
        });
      } else {
        _controller.text = '${_currentValue.toStringAsFixed(1)} ${widget.unit}'; // Przywrócenie poprzedniej wartości
      }
    } else {
      _controller.text = '${_currentValue.toStringAsFixed(1)} ${widget.unit}'; // Przywrócenie poprzedniej wartości
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _decrement,
          onLongPress: () => _startLongPress(false),
          onLongPressUp: _stopLongPress,
          child: IconButton(
            onPressed: null,
            icon: const Icon(Icons.remove),
          ),
        ),
        SizedBox(
          width: 140,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onChanged: _onSubmitted,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        ),
        GestureDetector(
          onTap: _increment,
          onLongPress: () => _startLongPress(true),
          onLongPressUp: _stopLongPress,
          child: IconButton(
            onPressed: null,
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
