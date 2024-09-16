import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/app_context.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/prompt_entity.dart';
import 'package:brain_box_ai/presentation/prompt_detail/widgets/prompt_detail_widget.dart';
import 'package:brain_box_ai/presentation/review/widgets/review_form_widget.dart';
import 'package:brain_box_ai/presentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';

abstract class PromptDetailPageCallBack {
  goReviewBottomSheet(BuildContext context);
}

class PromptDetailPage extends HookConsumerWidget
    implements PromptDetailPageCallBack {
  final PromptEntity promptEntity;
  const PromptDetailPage(this.promptEntity, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: _buildAppBarWidget(context),
      body: PromptDetailWidget(promptEntity),
      bottomNavigationBar: _buildBottomNaviWidget(context),
    );
  }

  Widget _buildBottomNaviWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, context.bottomSpacer),
      child: SizedBox(
        height: 52,
        child: ElevatedButton(
          onPressed: () {
            goReviewBottomSheet(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.appColors.primary, // Màu nền của nút
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(
            'Review',
            style: context.appTextStyles.labelLarge.bold
                .copyWith(color: context.appColors.onPrimary),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBarWidget(BuildContext context) {
    return AppBar(
      backgroundColor: context.appColors.surface,
      shadowColor: context.appColors.surface,
      centerTitle: true,
      title: Text(
        "Prompt Detail Page",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onSurface),
      ),
      leading: InkWell(
        onTap: () {
          context.pop();
        },
        child: ClipOval(
          child: SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              Assets.icBack.path,
              color: context.appColors.onSurface,
            ),
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: ClipOval(
            child: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(
                Assets.icMenuVertical.path,
                color: context.appColors.primary,
              ),
            ),
          ),
        ).paddingRightSpace(SpaceType.medium),
      ],
      elevation: 4.0,
    );
  }

  @override
  goReviewBottomSheet(BuildContext context) {
    CustomBottomSheet.showBottomSheet(
        context: context,
        title: "Review",
        child: const ReviewFormWidget(),
        scrollable: true);
  }
}
