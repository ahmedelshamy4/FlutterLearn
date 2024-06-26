import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;
  int _remainingTime;

  TimerCubit(this._remainingTime) : super(TimerInitial(_remainingTime));

  void startTimer() {
    _timer?.cancel();
    emit(TimerRunInProgress(_remainingTime));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        _remainingTime--;
        emit(TimerRunInProgress(_remainingTime));
      } else {
        timer.cancel();
        emit(const TimerComplete());
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    emit(TimerPaused(_remainingTime));
  }

  void resetTimer(int newTime) {
    _timer?.cancel();
    _remainingTime = newTime;
    emit(TimerInitial(_remainingTime));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
