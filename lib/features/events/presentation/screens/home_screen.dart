import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:task_app/core/resources/color_manager.dart';
import 'package:task_app/features/events/presentation/widgets/event_list.dart';
import 'package:task_app/features/events/presentation/widgets/list.dart';

import '../../../../core/resources/string_manager.dart';
import '../../../../core/resources/value_manger.dart';
import '../bloc/events_bloc.dart';
import '../widgets/date_time_line.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
          appBar: AppBar(title: const Text(AppStrings.schedule),
          leading: Icon(Icons.arrow_back_rounded),
          ),
          body:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorManager.primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s12)),
                                    child: Center(
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.s12,),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: Row(
                                      children: [
                                        Text(
                                          DateFormat('dd').format(
                                            BlocProvider.of<EventsBloc>(context)
                                                .showedDate!,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                        Padding(
                                      padding: const EdgeInsets.only(top:8.0,left: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                               Text(
                                            DateFormat('EEEE').format(
                                              BlocProvider.of<EventsBloc>(context)
                                                  .showedDate!,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                           Text(
                                            DateFormat('MMM yyyy').format(
                                              BlocProvider.of<EventsBloc>(context)
                                                  .showedDate!,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Expanded(
                              child: EventList()),
                        ],
                      ),
                    ),
                  ),
                )
             
        );
     
  }
}
