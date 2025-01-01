import 'dart:async';
import 'package:flutter/material.dart';

class TimeSpinBox extends StatefulWidget {
  final int initialMinutes;
  final int initialSeconds;
  final ValueChanged<double>? onChanged;

  const TimeSpinBox({
    Key? key,
    this.initialMinutes = 0,
    this.initialSeconds = 0,
    this.onChanged,
  }) : super(key: key);

  @override
  _TimeSpinBoxState createState() => _TimeSpinBoxState();
}

class _TimeSpinBoxState extends State<TimeSpinBox> {
  late int _currentMinutes;
  late int _currentSeconds;
  late TextEditingController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _currentMinutes = widget.initialMinutes;
    _currentSeconds = widget.initialSeconds;
    _controller = TextEditingController(text: _formatTime(_currentMinutes, _currentSeconds));
  }

  String _formatTime(int minutes, int seconds) {
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void _updateValue(int newMinutes, int newSeconds) {
    if (newMinutes >= 0 && newMinutes <= 59 && newSeconds >= 0 && newSeconds <= 59) {
      setState(() {
        _currentMinutes = newMinutes;
        _currentSeconds = newSeconds;
        _controller.text = _formatTime(_currentMinutes, _currentSeconds);
        double timeInMinutes = _currentMinutes + (_currentSeconds / 60.0);
        widget.onChanged?.call(timeInMinutes);
      });
    }
  }

  void _incrementMinutes() {
    _updateValue(_currentMinutes + 1, _currentSeconds);
  }

  void _decrementMinutes() {
    _updateValue(_currentMinutes - 1, _currentSeconds);
  }

  void _incrementSeconds() {
    _updateValue(_currentMinutes, _currentSeconds + 1);
  }

  void _decrementSeconds() {
    _updateValue(_currentMinutes, _currentSeconds - 1);
  }

  void _startLongPress(bool increment, bool isMinutes) {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (increment) {
        isMinutes ? _incrementMinutes() : _incrementSeconds();
      } else {
        isMinutes ? _decrementMinutes() : _decrementSeconds();
      }
    });
  }

  void _stopLongPress() {
    _timer?.cancel();
    _timer = null;
  }

  void _onSubmitted(String value) {
    final parts = value.split(':'); if (parts.length == 2) {
      final parsedMinutes = int.tryParse(parts[0].trim());
      final parsedSeconds = int.tryParse(parts[1].trim());
      if (parsedMinutes != null && parsedSeconds != null && parsedMinutes >= 0 && parsedMinutes < 60 && parsedSeconds >= 0 && parsedSeconds < 60)
      {_updateValue(parsedMinutes, parsedSeconds); }
      else { _controller.text = _formatTime(_currentMinutes, _currentSeconds); } }
    else { _controller.text = _formatTime(_currentMinutes, _currentSeconds); } }

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
          onTap: _decrementMinutes,
          onLongPress: () => _startLongPress(false, true),
          onLongPressUp: _stopLongPress,
          child: IconButton(
            onPressed: null,
            icon: const Icon(Icons.remove),
          ),
        ),
        GestureDetector(
          onTap: _decrementSeconds,
          onLongPress: () => _startLongPress(false, false),
          onLongPressUp: _stopLongPress,
          child: IconButton(
            onPressed: null,
            icon: const Icon(Icons.remove),
          ),
        ),
        SizedBox(
          width: 80,
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onSubmitted: _onSubmitted, // Keep validation on keyboard submission
            onChanged: (value) {
              // Pass raw value to onChanged without enforcing validation here
              if (widget.onChanged != null) {
                final parts = value.split(':');
                if (parts.length == 2) {
                  final parsedMinutes = int.tryParse(parts[0].trim()) ?? 0;
                  final parsedSeconds = int.tryParse(parts[1].trim()) ?? 0;
                  widget.onChanged!(parsedMinutes + parsedSeconds / 60.0);
                }
              }
            },
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        ),


        GestureDetector(
          onTap: _incrementMinutes,
          onLongPress: () => _startLongPress(true, true),
          onLongPressUp: _stopLongPress,
          child: IconButton(
            onPressed: null,
            icon: const Icon(Icons.add),
          ),
        ),
        GestureDetector(
          onTap: _incrementSeconds,
          onLongPress: () => _startLongPress(true, false),
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
