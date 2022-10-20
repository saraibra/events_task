part of 'events_bloc.dart';

abstract class EventsState {}

class EventsInitial extends EventsState {}

class LoadingEventstate extends EventsState {}

class LoadedEventsState extends EventsState {
  final List<Event> event;
  final int lastPage;

  LoadedEventsState({ this.lastPage=1, this.event = const <Event>[]});


  @override
  List<Object> get props => [lastPage,event];
}

class ErrorEventstate extends EventsState {
  final String message;

  ErrorEventstate(this.message);
}
