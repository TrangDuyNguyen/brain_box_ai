import 'package:brain_box_ai/providers/home/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utility/space_utils.dart';
import '../../widgets/category_item_widget.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/shimmer_widget.dart';

class CategoryWidget extends HookConsumerWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryNotifierProvider);
    final categoryNotifier = ref.read(categoryNotifierProvider.notifier);

    return categoryState.isLoading
        ? const ShimmerView().paddingTopSpace(SpaceType.medium)
        : categoryState.listCategory.isNotEmpty
            ? RefreshIndicator(
                onRefresh: () {
                  return categoryNotifier.fetchCategories();
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: categoryState.listCategory.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    var category = categoryState.listCategory[index];
                    return GestureDetector(
                      onTap: () {},
                      child: CategoryItemWidget(category, () => {}),
                    );
                  },
                ),
              )
            : const EmptyWidget();
  }
}
