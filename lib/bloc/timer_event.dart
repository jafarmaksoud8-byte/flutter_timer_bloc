part of 'timer_bloc.dart';

@immutable
sealed class TimerEvent {}

///     PlayedEvent
/// ↓
///1-إلغاء الاشتراك القديم
///   ↓
///Stream إنشاء
/// ↓
///كل ثانية
///  ↓
///x = 0
///  ↓
///60 - 0 - 1 = 59
///  ↓
/// 59 يستقبل  listen

///بعد ثانية
///x = 1
///   ↓
///60 - 1 - 1 = 58
///   ↓
///58 يستقبل  listen

///بعد ثانية
///x = 2
/// ↓
///60 - 2 - 1 = 57
///  ↓
///57 يستقبل  listen
class PlayEvent extends TimerEvent {}

class PauseEvent extends TimerEvent {}

class ResumeEvent extends TimerEvent {}

class ResetEvent extends TimerEvent {}

class TickedEvent extends TimerEvent {
  final int timerCurrentValue;

  TickedEvent({required this.timerCurrentValue});
}
