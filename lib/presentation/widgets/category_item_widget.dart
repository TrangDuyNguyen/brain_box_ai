import 'dart:ffi';

import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/search/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../assets/assets.gen.dart';

class CategoryItemWidget extends HookConsumerWidget {
  final CategoryEntity category;
  final VoidCallback onTap;
  const CategoryItemWidget(this.category, this.onTap, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: _buildCategoryDetails(context, category),
    );
  }

  Widget _buildCategoryDetails(BuildContext context, CategoryEntity category) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: context.appColors.primaryContainer,
          child:
          Image.asset(Assets.icX.path, width: 30, height: 30),
        ).paddingRightSpace(SpaceType.medium),
        Flexible(
          child: Text(
            category.name,
            style: context.appTextStyles.labelLarge
                .copyWith(color: context.appColors.onSurface),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
