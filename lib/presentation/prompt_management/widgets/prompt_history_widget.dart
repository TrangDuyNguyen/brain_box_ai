import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/prompt_management/prompt_history_management_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/prompt_management/state/prompt_history_state.dart';
import '../../widgets/prompt_card_widget.dart';
import '../../widgets/shimmer_widget.dart';

class PromptHistoryWidget extends HookConsumerWidget {
  const PromptHistoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyState = ref.watch(promptHistoryNotifierProvider);
    final historyNotifier = ref.read(promptHistoryNotifierProvider.notifier);

    return historyState is PromptHistoryLoading
        ? const ShimmerView().paddingTopSpace(SpaceType.medium)
        : historyState is PromptHistorySuccess
            ? ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: historyState.listPrompt.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: const PromptCardWidget(
                      title: 'Melos overview',
                      promptContent:
                          'Freezed là một gói giúp bạn tạo ra các lớp dữ liệu bất biến và các kiểu dữ liệu phân biệt (union/sealed classes) trong Dart.',
                      category: '',
                    ),
                  );
                },
              )
            : const SizedBox();
  }
}
