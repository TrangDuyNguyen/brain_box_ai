import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/data/datasources/dummy_data/dummy_data.dart';
import 'package:brain_box_ai/providers/home/category_notifier.dart';
import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/search/category_entity.dart';
import '../../../providers/search/filter_notifier.dart';

abstract class FilterPromptCallBack {
  onReset(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier);
  onApply(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier);
}

class FilterWidget extends HookConsumerWidget implements FilterPromptCallBack {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryState = ref.watch(categoryNotifierProvider);
    final filterState = ref.watch(filterNotifierProvider);
    final filterNotifier = ref.read(filterNotifierProvider.notifier);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildCategoryListChip(
                            context,
                            filterNotifier,
                            filterState.selectedCategoryIndices,
                            categoryState.listCategory),
                        _buildRateListChip(context, filterNotifier,
                            filterState.selectedRateIndex),
                      ],
                    ),
                    _buildBottomButton(context, filterState, filterNotifier)
                        .paddingBottomSpace(SpaceType.medium),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryListChip(
      BuildContext context,
      FilterNotifier filterNotifier,
      List<CategoryEntity> selectedCategoryChips,
      List<CategoryEntity> listCategoryChip) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Category",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onSurface),
      ).paddingTopSpace(SpaceType.large),
      Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: List<Widget>.generate(listCategoryChip.length, (int index) {
          final category = listCategoryChip[index];
          return ChoiceChip(
            label: Text(
              category.name,
              style: context.appTextStyles.labelMedium.copyWith(
                  color: selectedCategoryChips.contains(category)
                      ? context.appColors.onPrimary
                      : context.appColors.primary),
            ),
            selected: selectedCategoryChips.contains(category),
            onSelected: (selected) {
              filterNotifier.toggleCategoryChip(category);
            },
            backgroundColor: Colors.transparent,
            selectedColor: context.appColors.primary,
            shape: StadiumBorder(
              side: BorderSide(color: context.appColors.primary),
            ),
            elevation: 0,
          );
        }).toList(),
      ).paddingTopSpace(SpaceType.medium),
    ]);
  }

  Widget _buildRateListChip(BuildContext context, FilterNotifier filterNotifier,
      CategoryEntity selectedRateChip) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rating star",
          style: context.appTextStyles.titleMedium.bold,
        ).paddingTopSpace(SpaceType.large),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: List<Widget>.generate(listRateChip.length, (int index) {
            final rate = listRateChip[index];
            return ChoiceChip(
              label: Text(
                rate.name,
                style: context.appTextStyles.labelMedium.copyWith(
                    color: rate.id == selectedRateChip.id
                        ? context.appColors.onPrimary
                        : context.appColors.primary),
              ),
              selected: rate.id == selectedRateChip.id,
              onSelected: (selected) {
                filterNotifier.updateRateFilter(rate);
              },
              backgroundColor: Colors.transparent,
              selectedColor: context.appColors.primary,
              shape: StadiumBorder(
                side: BorderSide(color: context.appColors.primary),
              ),
              elevation: 0,
            );
          }).toList(),
        ).paddingTopSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildBottomButton(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 52,
            child: OutlinedButton(
              onPressed: () {
                onReset(context, filterState, filterNotifier);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: context.appColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Text(
                'Reset',
                style: context.appTextStyles.labelMedium.bold
                    .copyWith(color: context.appColors.primary),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                onApply(context, filterState, filterNotifier);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.appColors.primary,
                foregroundColor: context.appColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Text(
                'Apply',
                style: context.appTextStyles.labelMedium.bold
                    .copyWith(color: context.appColors.onPrimary),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  onApply(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier) {
    final selectedCategories = filterState.selectedCategoryIndices;
    final selectedRate = filterState.selectedRateIndex;

    // Lưu giá trị filter vào provider
    filterNotifier.updateCategoryFilter(selectedCategories);
    filterNotifier.updateRateFilter(selectedRate);

    context.pop();
  }

  @override
  onReset(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier) {
    filterNotifier.resetFilters();
  }
}
