import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/review/review_entity.dart';
import 'package:brain_box_ai/presentation/widgets/empty_widget.dart';
import 'package:brain_box_ai/providers/review/review_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/prompt_entity.dart';
import '../../widgets/review_card_widget.dart';
import '../../widgets/shimmer_widget.dart';

abstract class PromptDetailWidgetCallBack {}

class PromptDetailWidget extends HookConsumerWidget
    implements PromptDetailWidgetCallBack {
  final PromptEntity promptEntity;
  const PromptDetailWidget(this.promptEntity, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewNotifierProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContentPrompt(context, promptEntity),
          _buildResult(context),
          reviewState.isLoading == true
              ? const ShimmerView().paddingTopSpace(SpaceType.medium)
              : reviewState.listFilteredReview.isNotEmpty
                  ? _buildReview(context, reviewState.listFilteredReview)
                  : const EmptyWidget(),
        ],
      ),
    );
  }

  Widget _buildContentPrompt(BuildContext context, PromptEntity promptEntity) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          promptEntity.title,
          style: context.appTextStyles.titleMedium.bold
              .copyWith(color: context.appColors.onPrimaryContainer),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.appColors.secondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            promptEntity.category.name,
            style: context.appTextStyles.labelMedium
                .copyWith(color: context.appColors.onSecondaryContainer),
          ),
        ).paddingTopSpace(SpaceType.small),
        _buildInfoPrompt(context),
        Text(
          promptEntity.content,
          style: context.appTextStyles.labelLarge
              .copyWith(color: context.appColors.onPrimaryContainer),
          maxLines: null,
        ).paddingTopSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildInfoPrompt(BuildContext context) {
    return Wrap(
      children: [
        _buildInfoItem(context, "Copy", "15M")
            .paddingRightSpace(SpaceType.medium),
        _buildInfoItem(context, "Like", "10M")
            .paddingRightSpace(SpaceType.medium),
        _buildInfoItem(context, "Edit", "25M")
            .paddingRightSpace(SpaceType.medium),
        _buildInfoItem(context, "Save", "5M")
            .paddingRightSpace(SpaceType.medium),
        _buildInfoItem(context, "Rate", "${promptEntity.rate} ★")
      ],
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildInfoItem(BuildContext context, String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextStyles.labelLarge.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          Text(
            content,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.appTextStyles.labelLarge
                .copyWith(color: context.appColors.onSurface),
          ).paddingTopSpace(SpaceType.small)
        ],
      ),
    );
  }

  Widget _buildReview(
      BuildContext context, List<ReviewEntity> listFilteredReview) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Review",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.onSurface),
            ),
            const Spacer(),
            Text(
              "SEE ALL",
              style: context.appTextStyles.titleSmall.bold
                  .copyWith(color: context.appColors.onSurface),
            )
          ],
        ).paddingTopSpace(SpaceType.medium),
        ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var review = listFilteredReview[index];
                  return ReviewCardWidget(
                    reviewEntity: review,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: listFilteredReview.length > 5
                    ? 5
                    : listFilteredReview.length)
            .paddingVerticalSpace(SpaceType.medium)
      ],
    );
  }

  Widget _buildResult(BuildContext context) {
    return SizedBox();
  }
}
