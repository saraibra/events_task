// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:task_app/core/resources/color_manager.dart';
// import 'package:task_app/core/resources/value_manger.dart';
// import 'package:task_app/features/events/presentation/bloc/events_bloc.dart';
// import 'package:task_app/features/events/presentation/widgets/event_card.dart';

// import '../../domain/entities/event_entity.dart';
// import 'date_time_line.dart';

// class EventsList extends StatefulWidget {
//   EventsList({
//     super.key,
//   });

//   @override
//   State<EventsList> createState() => _EventsListState();
// }

// class _EventsListState extends State<EventsList> {
//   ScrollController scrollController = ScrollController();
//   List<Event> eventsList = [];

//   @override
//   void initState() {
//     super.initState();
//     eventsList = BlocProvider.of<EventsBloc>(context).events;

//     scrollController.addListener(() {
//       _scrollListener();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // widget.eventsList =
//     //     widget.eventsList + BlocProvider.of<EventsBloc>(context).events;

//     return RefreshIndicator(
//         color: ColorManager.primary,
//         onRefresh: () async {
//           if (BlocProvider.of<EventsBloc>(context).currentPage > 1) {
//             BlocProvider.of<EventsBloc>(context).currentPage--;
//           }
//           // BlocProvider.of<EventsBloc>(context)
//           //     .add(GetAllEventsEvent(1));
//         },
//         child: ListView.builder(
//           controller: scrollController,
//           itemBuilder: (context, index) {
//             if (index < BlocProvider.of<EventsBloc>(context).events.length) {
//               return Row(
//                 children: [
//                   SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.42,
//                       width: AppSize.s40,
//                       child: DateTimeLine(
//                         index: index,
//                       )),
//                   SizedBox(
//                     //width: MediaQuery.of(context).size.width * 0.7,
//                     child: EventCard(
//                       event: eventsList[index],
//                     ),
//                   ),
//                 ],
//               );
           
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//           itemCount: BlocProvider.of<EventsBloc>(context).isLoadingMore
//               ? eventsList.length + 1
//               : eventsList.length,
//         ));
//   }

//   Future<void> _scrollListener() async {
//     print('widget length first${eventsList.length}');
//     if (BlocProvider.of<EventsBloc>(context).hasNextPage) {
//       if (BlocProvider.of<EventsBloc>(context).isLoadingMore) return;

//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         // if (BlocProvider.of<EventsBloc>(context).hasNextPage) {
//         setState(() {
//           BlocProvider.of<EventsBloc>(context).isLoadingMore = true;
//           print(
//               'hasNextPage ${BlocProvider.of<EventsBloc>(context).isLoadingMore}');
//                    BlocProvider.of<EventsBloc>(context).currentPage++;
//         });
//               //   BlocProvider.of<EventsBloc>(context)..add(await GetAllEventsEvent(1));

//         // } else {
//         // }
//         setState(() {
//              BlocProvider.of<EventsBloc>(context).isLoadingMore = false;
//          print(
//               'hasNextPage ${BlocProvider.of<EventsBloc>(context).isLoadingMore}');

//          });

//         // setState(() {
//         //   BlocProvider.of<EventsBloc>(context).isLoadingMore = false;
//         //   print(
//         //       'hasNextPage ${BlocProvider.of<EventsBloc>(context).isLoadingMore}');
//         // });
//         // setState(() {
//         //   BlocProvider.of<EventsBloc>(context).isLoadingMore = true;

//         //         BlocProvider.of<EventsBloc>(context).currentPage =
//         //     BlocProvider.of<EventsBloc>(context).currentPage + 1;
//         // BlocProvider.of<EventsBloc>(context).add( GetAllEventsEvent(eventsList));
//         // print('widget length ${eventsList.length}');
//         // });

//         // setState(() {
//         //   BlocProvider.of<EventsBloc>(context).isLoadingMore = false;
//         // });
//       }
//     }
//   }

// }


