import 'package:task_app/core/resources/color_manager.dart';
import 'package:task_app/features/events/presentation/bloc/events_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../../../../core/resources/value_manger.dart';

class DateTimeLine extends StatelessWidget {
  DateTimeLine({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<EventsBloc>(context).currentDate.compareTo(
            DateFormat('dd MMM').format(DateTime.parse(
                BlocProvider.of<EventsBloc>(context).datesList[index]))) !=
        0) {
      BlocProvider.of<EventsBloc>(context).currentDate = DateFormat('dd MMM')
          .format(DateTime.parse(
              BlocProvider.of<EventsBloc>(context).datesList[index]));

      BlocProvider.of<EventsBloc>(context).showedDate =
          DateTime.parse(BlocProvider.of<EventsBloc>(context).datesList[index]);
      BlocProvider.of<EventsBloc>(context).emit(LoadedEventsState(
          event: BlocProvider.of<EventsBloc>(context).events));
      return TimelineTile(
        //alignment: TimelineAlign.start,
        afterLineStyle:
            LineStyle(color: ColorManager.grey, thickness: AppSize.s1),
        beforeLineStyle:
            LineStyle(color: ColorManager.grey, thickness: AppSize.s1),
        indicatorStyle: IndicatorStyle(
            width: AppSize.s28,
            height: AppSize.s50,
            // color: ColorManager.primary,
            indicator: Container(
              width: AppSize.s28,
              // height: AppSize.s50,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s8)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('dd').format(DateTime.parse(
                            BlocProvider.of<EventsBloc>(context)
                                .datesList[index])),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        DateFormat('MMM').format(DateTime.parse(
                            BlocProvider.of<EventsBloc>(context)
                                .datesList[index])),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      );
    } else {
      return TimelineTile(
        //alignment: TimelineAlign.start,
        afterLineStyle:
            LineStyle(color: ColorManager.grey, thickness: AppSize.s1),
        beforeLineStyle:
            LineStyle(color: ColorManager.grey, thickness: AppSize.s1),
        indicatorStyle: const IndicatorStyle(
            width: AppSize.s0,
            height: AppSize.s0,
            indicatorXY: 0,
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p14)
            // color: ColorManager.primary,
            ),
      );
    }
  }
}
