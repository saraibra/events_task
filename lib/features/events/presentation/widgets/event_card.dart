import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_app/core/resources/color_manager.dart';
import 'package:task_app/core/resources/value_manger.dart';
import 'package:task_app/features/events/domain/entities/event_entity.dart';
import 'package:task_app/features/events/presentation/widgets/dollar_container.dart';
import 'package:task_app/features/events/presentation/widgets/image_container.dart';
import 'package:task_app/features/events/presentation/widgets/users_list.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final Event event;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s12)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.41,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s12)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ImageContainer(
                    imagePath: event.images![0].url!,
                    tag: event.tag!,
                    spotsLeft: event.spots!),
                const SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                  DateFormat(
                    'EEEE dd MMM  yyyy . hh:mm a',
                  ).format(DateTime.parse(event.date!)),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  event.title!,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    event.placeName!,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${DateTime.parse(event.finishDate!).difference(DateTime.now()).inDays} days left',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    event.paymentMethod == 'CASH'
                        ? const DollarContainer()
                        : event.paymentMethod == 'BOTH'
                            ? Row(
                                children: const [
                                  DollarContainer(),
                                  Icon(Icons.credit_card),
                                  Icon(Icons.payment),
                                ],
                              )
                            : Row(
                                children: const [
                                  Icon(Icons.credit_card),
                                  Icon(Icons.payment),
                                ],
                              ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    event.price == 0 ? 'Free' : 'AED ${event.price}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                
                UsersList(users: event.users!)
              ]),
            ),
          ),
        ),
        const SizedBox(
          height: AppPadding.p16,
        ),
      ],
    );
  }
}
