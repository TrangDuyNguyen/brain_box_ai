import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../providers/prompt/prompt_notifier.dart';
import '../../widgets/prompt_card_widget.dart';

class PromptWidget extends HookConsumerWidget {
  final int categoryId;
  const PromptWidget(this.categoryId, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptState = ref.watch(promptNotifierProvider);
    useEffect(() {
      Future.microtask(() => ref.read(promptNotifierProvider.notifier).filterByCategory(categoryId));
      return null;
    }, [categoryId]);

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: promptState.filteredList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        var prompt = promptState.filteredList[index];
        return GestureDetector(
          onTap: () {},
          child: PromptCardWidget(
            promptEntity: prompt,
          ),
        );
      },
    );
  }
}
