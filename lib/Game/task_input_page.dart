// import 'package:flutter/material.dart';
// import 'package:flutter_learn/Game/main_task_page.dart';
//
// class TaskInputPage extends StatefulWidget {
//   static String routeName = '/TaskInputPage';
//
//   const TaskInputPage({super.key});
//
//   @override
//   State<TaskInputPage> createState() => _TaskInputPageState();
// }
//
// class _TaskInputPageState extends State<TaskInputPage> {
//   final _taskCountController = TextEditingController();
//   final _timeoutController = TextEditingController();
//
//   void _navigateToMainPage(BuildContext context) {
//     final int taskCount = int.parse(_taskCountController.text);
//     final int timeout = int.parse(_timeoutController.text);
//
//     Navigator.pushNamed(
//       context,
//       MainTaskPage.routeName,
//       arguments: {
//         'taskCount': taskCount,
//         'timeout': timeout,
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Task Input')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _taskCountController,
//               decoration: const InputDecoration(labelText: 'Task Count'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _timeoutController,
//               decoration: const InputDecoration(labelText: 'Timeout (minutes)'),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _navigateToMainPage(context),
//               child: const Text('Go to Main Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
