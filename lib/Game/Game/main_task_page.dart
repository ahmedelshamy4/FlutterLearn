// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:rigow_flutter/Game/task_page_details.dart';
// import 'package:rigow_flutter/core/utils/navigation/router_functions.dart';
//
// class MainTaskPage extends StatefulWidget {
//   final int taskCount;
//   final int timeout;
//   static String routeName = '/MainPage';
//
//   const MainTaskPage(
//       {super.key, required this.taskCount, required this.timeout});
//
//   @override
//   State<MainTaskPage> createState() => _MainTaskPageState();
// }
//
// class _MainTaskPageState extends State<MainTaskPage> {
//   late List<TaskTimer> _taskTimers;
//
//   @override
//   void initState() {
//     final int taskCount = widget.taskCount;
//     final int timeout = widget.timeout;
//     _taskTimers = List.generate(
//       taskCount,
//       (index) => TaskTimer(timeout: timeout * (index + 1)),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Main Page')),
//       body: ListView.builder(
//         itemCount: _taskTimers.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             onTap: () {
//               AppRouteNavigator.push(
//                 context,
//                 TaskPageDetails.routeName,
//                 TaskPageDetails(
//                   initialTimeout: widget.timeout,
//                 ),
//               );
//             },
//             title: Text('Task ${index + 1}'),
//             subtitle: _taskTimers[index],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class TaskTimer extends StatefulWidget {
//   final int timeout;
//
//   const TaskTimer({
//     super.key,
//     required this.timeout,
//   });
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
//   int get remainingTime => _remainingTime;
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
