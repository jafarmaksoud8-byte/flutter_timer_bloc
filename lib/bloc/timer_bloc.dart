import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  //Timer تحديد مدة
  final int duration = 60;
  //شيئ يرسل قيم متل قناة اليوتيوب stream
  //اشتراكي في هذا الشيئ حتى استقبل القيم منه subscription
  StreamSubscription<int>? tickerSubscription;
  TimerBloc() : super(TimerInitialState()) {
    on<TickedEvent>((event, emit) {
      if (event.timerCurrentValue == 0) {
        emit(TimerInitialState());
        tickerSubscription?.cancel();
      } else {
        emit(TimerRunningState(timer: event.timerCurrentValue));
      }
    });
    on<PlayEvent>((event, emit) {
      //1- سابق شغال اوقفه Timer  اذا كان هناك
      tickerSubscription?.cancel();

      //2- (second =1) يقوم بارسال قيم كل ثانية  stream انشاء
      tickerSubscription =
          Stream.periodic(
            Duration(seconds: 1),

            //3-stream تحديد القيمة التي يرسلها ال
            (x) => duration - x - 1,

            //4-  stream خذ فقط اول 60 قيمة من
            //5- يستمع لهذه القيم وكلما اتت قيمة جديدة نفذ الكود التالي listen  , يرسل القيم stream
          ).take(duration).listen((timerValue) {
            add(TickedEvent(timerCurrentValue: timerValue));
          });
    });
    on<PauseEvent>((event, emit) {
      emit(TimerPausedState(timer: state.timer));
      tickerSubscription?.cancel();
    });
    on<ResumeEvent>((event, emit) {
      final int currentTimer = state.timer;
      tickerSubscription?.cancel();
      tickerSubscription =
          Stream.periodic(
            Duration(seconds: 1),
            (x) => currentTimer - x - 1,
          ).take(currentTimer).listen((timerValue) {
            add(TickedEvent(timerCurrentValue: timerValue));
          });
    });
    on<ResetEvent>((event, emit) {
      emit(TimerInitialState());
      tickerSubscription?.cancel();
    });
  }
}
