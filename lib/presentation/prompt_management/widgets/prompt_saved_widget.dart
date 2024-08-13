import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utility/space_utils.dart';
import '../../../providers/prompt_management/prompt_saved_management_notifier.dart';
import '../../../providers/prompt_management/state/prompt_saved_state.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/prompt_card_widget.dart';
import '../../widgets/shimmer_widget.dart';

class PromptSavedWidget extends HookConsumerWidget {
  const PromptSavedWidget({super.key});

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedState = ref.watch(promptSavedNotifierProvider);
    final savedNotifier = ref.read(promptSavedNotifierProvider.notifier);

    return savedState is PromptSavedLoading
        ? Column(
            children: [
              const ShimmerView().paddingTopSpace(SpaceType.medium),
            ],
          )
        : savedState is PromptSavedSuccess
            ? RefreshIndicator(
                onRefresh: () {
                  return savedNotifier.getListSavedPrompt();
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: savedState.listPrompt.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    var prompt = savedState.listPrompt[index];
                    return GestureDetector(
                      onTap: () {},
                      child: PromptCardWidget(
                        promptEntity: prompt,
                      ),
                    );
                  },
                ),
              )
            : const EmptyWidget();
  }
}
