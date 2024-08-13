import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/app_context.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:flutter/material.dart';

import '../../assets/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.icEmptyBox.image(),
        Text(
          "No Result Found",
          style: context.appTextStyles.titleMedium.bold,
        ).paddingTopSpace(SpaceType.medium)
      ],
    );
  }
}
