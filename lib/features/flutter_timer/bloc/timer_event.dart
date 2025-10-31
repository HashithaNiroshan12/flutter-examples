part of 'timer_bloc.dart';

class TimerEvent {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  final int duraion;
  const TimerStarted({required this.duraion});
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class TimerTicked extends TimerEvent {
  final int duraion;
  const TimerTicked({required this.duraion});
}
