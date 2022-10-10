

import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/value_manger.dart';

class DollarContainer extends StatelessWidget {
  const DollarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                        width: AppSize.s20,
                        height: AppSize.s20,
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorManager.primary)),
                        child: Center(
                          child: Text(
                            '\$',
                            style: TextStyle(color: ColorManager.primary),
                          ),
                        ));
  }
}