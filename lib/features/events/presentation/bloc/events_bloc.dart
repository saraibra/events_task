import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

import 'package:task_app/features/events/domain/use_cases/get_all_events_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/resources/string_manager.dart';
import '../../domain/entities/event_entity.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetAllEventsUseCase getAllEventsUseCase;
  static const _pageSize = 10;
  int currentPage = 1;
  bool isLastPage = false;
  List<String> datesList = [];
  List<Event> events = [];
  String currentDate = '';
  DateTime? showedDate;
  EventsBloc(this.getAllEventsUseCase) : super(EventsInitial()) {
    on<EventsEvent>((event, emit) async {
      if (event is GetAllEventsEvent) {
        events = [];
        emit(LoadingEventstate());
        String currentDate = DateFormat('ddMMMyyyy').format(DateTime.now());
        showedDate = DateTime.now();
        final Either<Failure, List<Event>> eventList =
            await getAllEventsUseCase(
                currentDate: currentDate, pageNumber: currentPage);
        eventList.fold(
            (failure) =>
                emit(ErrorEventstate(_getFailureErrorMessage(failure))),
            (event) {
          isLastPage = event.length == _pageSize;

          if (isLastPage) {
            currentPage++;
          }
          events.addAll(event);
          event.forEach((element) {
            datesList.add(element.date!);
          });
          emit(LoadedEventsState(event: event));
        });
      }
    });
  }

  String _getFailureErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverError;
      case EmptyCasheFailure:
        return AppStrings.cashError;
      case OfflineFailure:
        return AppStrings.offlineErrpr;
      default:
        return AppStrings.unexpectedError;
    }
  }
}
