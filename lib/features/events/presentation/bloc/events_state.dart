part of 'events_bloc.dart';

abstract class EventsState {}

class EventsInitial extends EventsState {}
class LoadingEventstate extends EventsState {}
class LoadedEventsState extends EventsState {
  final List< Event> event;

  LoadedEventsState({required this.event});
  
  
  @override
  List<Object> get props => [event];
}
class ErrorEventstate extends EventsState {
  final String message;

  ErrorEventstate(this.message);
}
