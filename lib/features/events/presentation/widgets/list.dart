import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/value_manger.dart';
import '../../domain/entities/event_entity.dart';
import '../bloc/events_bloc.dart';
import 'date_time_line.dart';
import 'event_card.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  // final PagingController<int, Event> pagingController =
  //     PagingController(firstPageKey: 1);
  // List<Event> events = [];
  PagingStatus? status;

  @override
  void initState() {
    BlocProvider.of<EventsBloc>(context)
        .pagingController
        .addPageRequestListener((pageKey) {
      BlocProvider.of<EventsBloc>(context).add(GetAllEventsEvent(pageKey));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsBloc, EventsState>(listener: (context, state) {
      // if (state is LoadedEventsState) {
      //   events = [];
      //   events = state.event;
      //   final next = 1 + events.length;
      //   final lastPage = 2;
      //   if (next > lastPage) {
      //     print('state ${state.lastPage}');
      //     pagingController.appendLastPage(events);
      //   } else {
      //     //final nextPageKey = event.pageKey + element.length;
      //     pagingController.appendPage(events, next);
      //   }
      // }
    }, builder: (context, state) {
      return RefreshIndicator(
        color: ColorManager.primary,
        onRefresh: () {
          if (BlocProvider.of<EventsBloc>(context).currentPage > 1) {
            BlocProvider.of<EventsBloc>(context).currentPage--;
          }
          return Future.sync(() =>
              BlocProvider.of<EventsBloc>(context).pagingController.refresh());
        },
        child: PagedListView<int, Event>(
          pagingController:
              BlocProvider.of<EventsBloc>(context).pagingController,
          primary: false,
          builderDelegate: PagedChildBuilderDelegate<Event>(
              firstPageProgressIndicatorBuilder: (context) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                );
              },
              newPageProgressIndicatorBuilder: (context) {
                return  Align(
                  alignment: Alignment.bottomCenter,
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      );
              },
              animateTransitions: true,
              noMoreItemsIndicatorBuilder: (context) => Center(
                      child: Text(
                    'No more events',
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
              itemBuilder: (context, item, index) => Row(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.42,
                          width: AppSize.s40,
                          child: DateTimeLine(
                            index: index,
                          )),
                      SizedBox(
                        //width: MediaQuery.of(context).size.width * 0.7,
                        child: EventCard(
                          event: item,
                        ),
                      ),
                    ],
                  )),
        ),
      );
    });
  }

  void dispose() {
    BlocProvider.of<EventsBloc>(context).close();
    BlocProvider.of<EventsBloc>(context).pagingController.dispose();
    super.dispose();
  }
}
