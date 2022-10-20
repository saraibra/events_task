part of 'events_bloc.dart';

abstract class EventsEvent {}
class GetAllEventsEvent extends EventsEvent {
  final int pageKey;
  GetAllEventsEvent( this.pageKey);
}
