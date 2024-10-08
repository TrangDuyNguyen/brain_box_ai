import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/presentation/prompt_management/widgets/prompt_saved_widget.dart';
import 'package:brain_box_ai/presentation/prompt_management/widgets/prompt_favorite_widget.dart';
import 'package:brain_box_ai/presentation/prompt_management/widgets/prompt_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';

class PromptManagementContentWidget extends HookConsumerWidget {
  const PromptManagementContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.appColors.surface,
          shadowColor: context.appColors.surface,
          leading: const SizedBox(width: 0,),
          centerTitle: true,
          title: Text(
            "Prompt Management",
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: ClipOval(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    Assets.icSearch.path,
                    color: context.appColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            InkWell(
              onTap: () {},
              child: ClipOval(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    Assets.icFilter.path,
                    color: context.appColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48.0),
            child: TabBar(
              controller: tabController,
              labelStyle: context.appTextStyles.labelLarge,
              labelColor: context.appColors.onSurface,
              indicatorColor: context.appColors.secondary,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'History'),
                Tab(text: 'Favorite'),
                Tab(text: 'Saved'),
              ],
            ),
          ),
          elevation: 4.0, // Độ cao của AppBar (shadow)
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            PromptHistoryWidget(),
            PromptFavoriteWidget(),
            PromptSavedWidget(),
          ],
        ));
  }
}
