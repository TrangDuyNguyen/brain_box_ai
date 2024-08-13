import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utility/space_utils.dart';
import '../../../providers/prompt_management/prompt_favorite_management_notifier.dart';
import '../../../providers/prompt_management/state/prompt_favorite_state.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/prompt_card_widget.dart';
import '../../widgets/shimmer_widget.dart';

class PromptFavoriteWidget extends HookConsumerWidget {
  const PromptFavoriteWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(promptFavoriteNotifierProvider);
    final favoriteNotifier = ref.read(promptFavoriteNotifierProvider.notifier);

    return favoriteState is PromptFavoriteLoading
        ? const ShimmerView().paddingTopSpace(SpaceType.medium)
        : favoriteState is PromptFavoriteSuccess
            ? RefreshIndicator(
                onRefresh: () {
                  return favoriteNotifier.getListFavoritePrompt();
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: favoriteState.listPrompt.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    var prompt = favoriteState.listPrompt[index];
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
