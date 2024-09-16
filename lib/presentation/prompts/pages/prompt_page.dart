import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/presentation/widgets/empty_widget.dart';
import 'package:brain_box_ai/providers/home/category_notifier.dart';
import 'package:brain_box_ai/providers/prompt/prompt_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../widgets/shimmer_widget.dart';
import '../widgets/prompt_widget.dart';

abstract class PromptPageCallBack {
  goSearch(BuildContext context);
  goPromptDetail(BuildContext context);
}

class PromptPage extends HookConsumerWidget implements PromptPageCallBack {
  final int initialIndex;
  const PromptPage({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptState = ref.watch(promptNotifierProvider);

    final categoryState = ref.watch(categoryNotifierProvider);
    final tabController = useTabController(
      initialIndex: initialIndex,
      initialLength: categoryState.listCategory.isNotEmpty
          ? categoryState.listCategory.length
          : 1,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appColors.surface,
        shadowColor: context.appColors.surface,
        centerTitle: true,
        title: Text(
          "Prompt Page",
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
                  Assets.icSearch.path,
                  color: context.appColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: TabBar(
            tabAlignment: TabAlignment.start,
            controller: tabController,
            labelStyle: context.appTextStyles.labelLarge,
            labelColor: context.appColors.onSurface,
            indicatorColor: context.appColors.secondary,
            dividerColor: Colors.transparent,
            padding: EdgeInsets.zero,
            isScrollable: true,
            tabs: categoryState.listCategory.map((tab) {
              return Tab(
                text: tab.name,
              );
            }).toList(),
          ),
        ),
        elevation: 4.0,
      ),
      body: TabBarView(
        controller: tabController,
        children: categoryState.listCategory.map((tab) {
          return promptState.isLoading == true
              ? const ShimmerView().paddingTopSpace(SpaceType.medium)
              : promptState.filteredList.isNotEmpty
                  ? PromptWidget(tab.id)
                  : const EmptyWidget();
        }).toList(),
      ),
    );
  }

  @override
  goPromptDetail(BuildContext context) {
    // TODO: implement goPromptDetail
    throw UnimplementedError();
  }

  @override
  goSearch(BuildContext context) {
    // TODO: implement goSearch
    throw UnimplementedError();
  }
}
