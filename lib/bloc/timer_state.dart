part of 'timer_bloc.dart';

@immutable
sealed class TimerState {
  final int timer;

  const TimerState({required this.timer});
}

final class TimerInitialState extends TimerState {
  const TimerInitialState() : super(timer: 60);
}

final class TimerRunningState extends TimerState {
  const TimerRunningState({required super.timer});
}

final class TimerPausedState extends TimerState {
  const TimerPausedState({required super.timer});
}
