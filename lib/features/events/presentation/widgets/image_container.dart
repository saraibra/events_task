import 'package:flutter/material.dart';
import 'package:task_app/core/resources/color_manager.dart';
import 'package:task_app/features/events/domain/entities/event_entity.dart';

import '../../../../core/resources/value_manger.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {super.key,
      required this.imagePath,
      required this.tag,
      required this.spotsLeft});
  final String imagePath;
  final Tag tag;
  final int spotsLeft;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.21;
    return Stack(
      children: [
        Container(
          //width: MediaQuery.of(context).size.width * 0.7,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s8),
              image: DecorationImage(
                  image: NetworkImage(
                    'https://ik.imagekit.io/tnc8pizf9e/$imagePath?tr=w-$width,h-$height',
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
          top: AppPadding.p12,
          left: AppPadding.p12,
          child: Container(
            height: AppSize.s28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s18),
                color: ColorManager.white.withOpacity(0.8)),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p4),
              child: Row(
                children: [
                  Container(
                    height: AppSize.s25,
                    width: AppSize.s25,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://ik.imagekit.io/tnc8pizf9e/${tag.icon}?tr=w-22,h-22',
                          ),
                          fit: BoxFit.contain,
                        )),
                  ),
                  const SizedBox(width: AppSize.s4),
                  Text(
                    tag.title!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: AppPadding.p12,
            left: AppPadding.p12,
            child: Container(
              height: AppSize.s28,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s18),
                  color: ColorManager.white.withOpacity(0.8)),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p4),
                child: spotsLeft == 0
                    ? Text(
                        'UnLimited spots',
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    : Text(
                        '$spotsLeft Spots left',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
              ),
            ))
      ],
    );
  }
}
