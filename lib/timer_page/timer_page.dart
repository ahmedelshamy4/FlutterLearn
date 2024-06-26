import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timer_cubit.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timerCubit = context.read<TimerCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          if (state is TimerComplete) {
            return Center(child: Text('Timer Complete!'));
          }
          return Center(child: Text('Remaining Time: ${state.remainingTime}'));
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: timerCubit.startTimer,
            child: Icon(Icons.play_arrow),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: timerCubit.pauseTimer,
            child: Icon(Icons.pause),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => timerCubit.resetTimer(60), // Reset to 60 seconds
            child: Icon(Icons.replay),
          ),
        ],
      ),
    );
  }
}
