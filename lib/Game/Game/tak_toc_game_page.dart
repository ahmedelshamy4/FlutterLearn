// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:rigow_flutter/core/utils/constants/text_styles.dart';
//
// class TakTocGamePage extends StatefulWidget {
//   const TakTocGamePage({super.key});
//
//   @override
//   State<TakTocGamePage> createState() => _TakTocGamePageState();
// }
//
// class _TakTocGamePageState extends State<TakTocGamePage> {
//   static var customFontWhite = TextStyles.medium();
//   int attemps = 0;
//   int xscore = 0;
//   int oscore = 0;
//   List<int> matchedIndex = [];
//   List<String> gridList = ['', '', '', '', '', '', '', '', ''];
//   Timer? timer;
//   bool toggle = true;
//   int filledBoxes = 0;
//   String result = '';
//   static const maxSeconds = 30;
//   int seconds = maxSeconds;
//
//   void _startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (_) {
//       setState(() {
//         if (seconds > 0) {
//           seconds--;
//         } else {
//           _stopTimer();
//         }
//       });
//     });
//   }
//
//   void _handelTap(int index) {
//     final isTimerRunning = timer == null ? false : timer!.isActive;
//     if (isTimerRunning) {
//       if (toggle && gridList[index] == '') {
//         gridList[index] = '0';
//         filledBoxes++;
//       } else if (!toggle && gridList[index] == '') {
//         gridList[index] = 'X';
//         filledBoxes++;
//       }
//       setState(() {
//         toggle = !toggle;
//         _checkWinner();
//       });
//     }
//   }
//
//   void _checkWinner() {
//     ///  1st row..
//     if (gridList[0] == gridList[1] &&
//         gridList[0] == gridList[2] &&
//         gridList[0] != '') {
//       result = 'Player ${gridList[0]} Wins!';
//       matchedIndex.addAll([0, 1, 2]);
//       _stopTimer();
//       _updatedScore(gridList[0]);
//     }
//
//     /// 2nd row...
//     if (gridList[3] == gridList[4] &&
//         gridList[3] == gridList[5] &&
//         gridList[3] != '') {
//       result = 'Player ${gridList[3]} Wins!';
//       matchedIndex.addAll([3, 4, 5]);
//       _stopTimer();
//       _updatedScore(gridList[3]);
//     }
//
//     /// 3nd row...
//     if (gridList[6] == gridList[7] &&
//         gridList[6] == gridList[8] &&
//         gridList[6] != '') {
//       result = 'Player ${gridList[6]} Wins!';
//       matchedIndex.addAll([6, 7, 8]);
//       _stopTimer();
//       _updatedScore(gridList[6]);
//     }
//
//     ///  1st column...
//     if (gridList[0] == gridList[3] &&
//         gridList[0] == gridList[6] &&
//         gridList[0] != '') {
//       setState(() {
//         result = 'Player ${gridList[0]} Wins!';
//         matchedIndex.addAll([0, 3, 6]);
//         _stopTimer();
//         _updatedScore(gridList[0]);
//       });
//     }
//
//     /// 2nd column
//     if (gridList[1] == gridList[4] &&
//         gridList[1] == gridList[7] &&
//         gridList[1] != '') {
//       setState(() {
//         result = 'Player ${gridList[1]} Wins!';
//         matchedIndex.addAll([1, 4, 7]);
//         _stopTimer();
//         _updatedScore(gridList[1]);
//       });
//     }
//
//     /// 3rd column
//     if (gridList[2] == gridList[5] &&
//         gridList[2] == gridList[8] &&
//         gridList[2] != '') {
//       setState(() {
//         result = 'Player ${gridList[2]} Wins!';
//         matchedIndex.addAll([5, 8, 2]);
//         _stopTimer();
//         _updatedScore(gridList[2]);
//       });
//     }
//
//     /// 1st diagonal
//     if (gridList[0] == gridList[4] &&
//         gridList[0] == gridList[8] &&
//         gridList[0] != '') {
//       setState(() {
//         result = 'Player ${gridList[0]} Wins!';
//         matchedIndex.addAll([0, 4, 8]);
//         _stopTimer();
//         _updatedScore(gridList[0]);
//       });
//     }
//
//     /// 2nd diagonal
//     if (gridList[2] == gridList[4] &&
//         gridList[2] == gridList[6] &&
//         gridList[2] != '') {
//       setState(() {
//         result = 'Player ${gridList[2]} Wins!';
//         matchedIndex.addAll([4, 6, 2]);
//         _stopTimer();
//         _updatedScore(gridList[2]);
//       });
//     }
//     if (!winnerFound && filledBoxes == 9) {
//       setState(() {
//         result = 'Nobody Wins!';
//       });
//     }
//   }
//
//   void _stopTimer() {
//     resetTimer();
//     timer?.cancel();
//   }
//
//   void resetTimer() {
//     seconds = maxSeconds;
//   }
//
//   bool winnerFound = false;
//
//   void _updatedScore(String winner) {
//     if (winner == '0') {
//       oscore++;
//     } else if (winner == 'X') {
//       xscore++;
//     }
//     winnerFound = true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepOrange[100],
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _customColumTile(
//                     player: 'Player O',
//                     result: oscore.toString(),
//                   ),
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   _customColumTile(
//                     player: 'Player X',
//                     result: xscore.toString(),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: GridView.builder(
//                 itemCount: gridList.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () => _handelTap(index),
//                     behavior: HitTestBehavior.translucent,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         border: Border.all(
//                           width: 5,
//                           color: const Color.fromARGB(255, 255, 204, 188),
//                         ),
//                         color: matchedIndex.contains(index)
//                             ? Colors.amber[200]
//                             : Colors.deepPurple[100],
//                       ),
//                       child: Center(
//                         child: Text(
//                           gridList[index],
//                           style: TextStyles.medium(),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               flex: 2,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       result,
//                       style: customFontWhite,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     _buildTimer(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTimer() {
//     final isTimerActive = timer == null ? false : timer!.isActive;
//     return isTimerActive
//         ? SizedBox(
//             height: 100,
//             width: 100,
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 CircularProgressIndicator(
//                   value: 1 - seconds / maxSeconds,
//                   valueColor: const AlwaysStoppedAnimation(Colors.white),
//                   strokeWidth: 8,
//                   backgroundColor: Colors.red[300],
//                 ),
//                 Center(
//                   child: Text(
//                     '$seconds',
//                     style: const TextStyle(
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                         fontSize: 40),
//                   ),
//                 )
//               ],
//             ),
//           )
//         : ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepOrange[200],
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 30, vertical: 17)),
//             onPressed: () {
//               _startTimer();
//               _clearBoard();
//               attemps++;
//             },
//             child: Text(
//               attemps == 0 ? 'Start' : 'Play Again!',
//               style: TextStyle(
//                 fontSize: 23,
//                 color: Colors.deepPurple[300],
//               ),
//             ),
//           );
//   }
//
//   void _clearBoard() {
//     for (int i = 0; i < gridList.length; i++) {
//       gridList[i] = '';
//     }
//     result = '';
//
//     filledBoxes = 0;
//     setState(() {});
//   }
//
//   Widget _customColumTile({
//     required String player,
//     required String result,
//   }) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Text(
//           player,
//           style: customFontWhite,
//         ),
//         Text(
//           result,
//           style: customFontWhite,
//         ),
//       ],
//     );
//   }
// }
