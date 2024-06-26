part of 'timer_cubit.dart';

@immutable
abstract class TimerState {
  final int remainingTime;
  const TimerState(this.remainingTime);
}

class TimerInitial extends TimerState {
  const TimerInitial(int remainingTime) : super(remainingTime);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int remainingTime) : super(remainingTime);
}

class TimerPaused extends TimerState {
  const TimerPaused(int remainingTime) : super(remainingTime);
}

class TimerComplete extends TimerState {
  const TimerComplete() : super(0);
}
