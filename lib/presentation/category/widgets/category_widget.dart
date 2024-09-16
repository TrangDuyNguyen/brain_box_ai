import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/providers/home/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categoryState.listCategory.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      var item = categoryState.listCategory[index];
                      return CategoryItemWidget(item,
                          () => context.push(RouterPath.promptPage.getPath, extra: index));
                    }),
              )
            : const EmptyWidget();
  }
}
