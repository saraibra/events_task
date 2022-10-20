import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:task_app/features/events/domain/use_cases/get_all_events_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/resources/string_manager.dart';
import '../../domain/entities/event_entity.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final GetAllEventsUseCase getAllEventsUseCase;
  int pageSize = 10;
  int currentPage = 1;
  bool hasNextPage = true;
  List<String> datesList = [];
  List<Event> events = [];
  String currentDate = '';
  bool isLastPage = false;
  final PagingController<int, Event> pagingController =
      PagingController(firstPageKey: 0);
  DateTime? showedDate = DateTime.now();
  EventsBloc(this.getAllEventsUseCase) : super(EventsInitial()) {
    on<EventsEvent>((event, emit) async {
      events = [];

      if (event is GetAllEventsEvent) {
        emit(LoadingEventstate());
        String currentDate = DateFormat('ddMMMyyyy').format(DateTime.now());
        showedDate = DateTime.now();
        final Either<Failure, List<Event>> eventList =
            await getAllEventsUseCase(
                currentDate: currentDate, pageNumber: currentPage);
        eventList.fold(
            (failure) =>
                emit(ErrorEventstate(_getFailureErrorMessage(failure))),
            (element) {
          events.addAll(element);
print(element.length);
          // if (element.length == pageSize) {
          //   hasNextPage = true;
          //   if (isLoadingMore) events.addAll(event.oldEvents);
          // } else {
          //   hasNextPage = false;
          // }
          if (element.length != pageSize) {
            isLastPage = true;
           pagingController.appendLastPage(element);
                        print('${event.pageKey} ${element.length}');
            currentPage--;

          } else {
            isLastPage = false;
            final nextPageKey = event.pageKey + element.length;
            print('${event.pageKey} ${element.length}');
            pagingController.appendPage(element, nextPageKey);
            currentPage++;
          }
          // if (isLastPage) {
          //   pagingController.appendLastPage(element);

          // } else {

          //   final nextPageKey = event.pageKey + element.length;
          //   pagingController.appendPage(element, nextPageKey);
          // }

          events.forEach((element) {
            datesList.add(element.date!);
          });
          emit(LoadedEventsState(event: events));
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
