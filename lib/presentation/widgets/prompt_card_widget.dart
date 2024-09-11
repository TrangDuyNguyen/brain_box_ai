import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/prompt_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../assets/assets.gen.dart';

class PromptCardWidget extends HookConsumerWidget {
  final PromptEntity promptEntity;
  const PromptCardWidget({super.key, required this.promptEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLike = useState(promptEntity.like);
    final isSave = useState(promptEntity.save);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: context.appColors.brandPrimaryGradient,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Ensure alignment prevents flex errors
        children: [
          Expanded(
            child: _buildPromptDetails(context),
          ),
          _buildActionIcons(context, isLike, isSave),
        ],
      ),
    );
  }

  Widget _buildPromptDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        _buildRatingAndCategory(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      promptEntity.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.appTextStyles.titleMedium.bold
          .copyWith(color: context.appColors.onPrimary),
    );
  }

  Widget _buildRatingAndCategory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingBar(context),
            const SizedBox(width: 8.0),
            Text(
              promptEntity.rate.toString(),
              style: context.appTextStyles.labelMedium
                  .copyWith(color: context.appColors.onPrimary),
            ),
          ],
        ).paddingTopSpace(SpaceType.small),
        Text(
          promptEntity.category.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.appTextStyles.labelSmall
              .copyWith(color: context.appColors.onPrimary),
        ).paddingTopSpace(SpaceType.small),
      ],
    );
  }

  Widget _buildRatingBar(BuildContext context) {
    return RatingBar.builder(
      initialRating: promptEntity.rate.toDouble(),
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 14,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => Image.asset(
        Assets.icRatingStar.path,
        color: context.appColors.onPrimary,
      ),
      unratedColor: context.appColors.outline,
      onRatingUpdate: (rating) {},
      ignoreGestures: true,
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      promptEntity.content,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: context.appTextStyles.labelMedium
          .copyWith(color: context.appColors.onPrimary),
    ).paddingTopSpace(SpaceType.small);
  }

  Widget _buildActionIcons(BuildContext context, ValueNotifier<bool> isLike,
      ValueNotifier<bool> isSave) {
    return Column(
      children: [
        _buildSaveIcon(context, isSave),
        _buildLikeIcon(context, isLike),
      ],
    );
  }

  Widget _buildSaveIcon(BuildContext context, ValueNotifier<bool> isSave) {
    return InkWell(
      onTap: () {
        isSave.value = !isSave.value;
      },
      child: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          Assets.icSave.path,
          color: isSave.value
              ? context.appColors.primary
              : context.appColors.onPrimary,
        ),
      ),
    );
  }

  Widget _buildLikeIcon(BuildContext context, ValueNotifier<bool> isLike) {
    return InkWell(
      onTap: () {
        isLike.value = !isLike.value;
      },
      child: SizedBox(
        width: 24,
        height: 24,
        child: Image.asset(
          isLike.value ? Assets.icHeartFill.path : Assets.icHeartOff.path,
          color: isLike.value
              ? context.appColors.primary
              : context.appColors.onPrimary,
        ),
      ),
    ).paddingTopSpace(SpaceType.small);
  }
}
