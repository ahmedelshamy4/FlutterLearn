import 'dart:async';

import 'package:flutter/material.dart';

class TaskPageDetails extends StatefulWidget {
  static String routeName = '/TaskPageDetails';
  final int initialTimeout;
  const TaskPageDetails({super.key, required this.initialTimeout});

  @override
  State<TaskPageDetails> createState() => _TaskPageDetailsState();
}

class _TaskPageDetailsState extends State<TaskPageDetails> {
  late Timer _timer;
  late int _remainingTime;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = widget.initialTimeout * 60; // Convert minutes to seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _showResetDialog();
        _timer.cancel();
      }
    });
  }

  void _resetTimer() {
    _timer.cancel();
    _startTimer();
  }
  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Timer Ended'),
        content: const Text('Do you want to reset the timer?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Navigate back to main page
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetTimer();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
    return Scaffold(
      appBar: AppBar(title: const Text('Task Detail')),
      body: Center(
        child: Text(
          '$minutes:$seconds',
          style: const TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
