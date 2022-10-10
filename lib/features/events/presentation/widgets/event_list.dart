import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter/material.dart';
import 'package:task_app/core/resources/value_manger.dart';
import 'package:task_app/features/events/presentation/bloc/events_bloc.dart';
import 'package:task_app/features/events/presentation/widgets/event_card.dart';

import '../../domain/entities/event_entity.dart';
import 'date_time_line.dart';

class EventsList extends StatefulWidget {
  const EventsList({super.key, required this.eventsList});
  final List<Event> eventsList;

  @override
  State<EventsList> createState() => _EventsListState();
}

class _EventsListState extends State<EventsList> {
  ScrollController scrollController = ScrollController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
    //
    scrollController.addListener(() {
      if (scrollController.position.extentAfter == 0 &&
          BlocProvider.of<EventsBloc>(context).isLastPage) {
        print('max scrollll');
        BlocProvider.of<EventsBloc>(context).add(GetAllEventsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      onRefresh: () {
        BlocProvider.of<EventsBloc>(context).currentPage--;
        BlocProvider.of<EventsBloc>(context).add(GetAllEventsEvent());
      },
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          return Row(
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
                  event: widget.eventsList[index],
                ),
              ),
            ],
          );
        },
        
        itemCount: widget.eventsList.length,
      ),
    );
  }
}
