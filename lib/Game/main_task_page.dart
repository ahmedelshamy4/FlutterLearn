// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// class MainTaskPage extends StatefulWidget {
//   static String routeName = '/MainPage';
//
//   const MainTaskPage({super.key});
//
//   @override
//   State<MainTaskPage> createState() => _MainTaskPageState();
// }
//
// class _MainTaskPageState extends State<MainTaskPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Main Page')),
//       body: ListView.builder(
//         itemCount:,
//         itemBuilder: (context, index) {
//
//         },
//       ),
//     );
//   }
// }
//
// class TaskTimer extends StatefulWidget {
//   final int timeout;
//
//   const TaskTimer({super.key, required this.timeout,});
//
//   @override
//   State<TaskTimer> createState() => _TaskTimerState();
// }
//
// class _TaskTimerState extends State<TaskTimer> {
//   late Timer _timer;
//   late int _remainingTime;
//
//   @override
//   void initState() {
//     _remainingTime = widget.timeout * 60; // Convert minutes to seconds
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_remainingTime > 0) {
//         setState(() {
//           _remainingTime--;
//         });
//       } else {
//         _timer.cancel();
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final minutes = (_remainingTime ~/ 60).toString().padLeft(2, '0');
//     final seconds = (_remainingTime % 60).toString().padLeft(2, '0');
//     return Text('$minutes:$seconds');
//   }
// }
