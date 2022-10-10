import 'package:flutter/material.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/value_manger.dart';
import '../../domain/entities/event_entity.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key, required this.users});
  final List<Users> users;
  final double overlap = 20.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: List.generate(
      users.length,
      (index) => Padding(
          padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
          child: CircleAvatar(
            radius: AppSize.s18,
            backgroundColor: ColorManager.white,
            child: Container(
              height: AppSize.s32,
              width: AppSize.s32,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://ik.imagekit.io/tnc8pizf9e/${users[index].profilePicture}?tr=w-28,h-28',
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    ));
  }
}
