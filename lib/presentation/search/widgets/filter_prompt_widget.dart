import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/data/datasources/dummy_data/dummy_data.dart';
import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../providers/search/filter_notifier.dart';

abstract class FilterPromptCallBack {
  onReset(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier);
  onApply(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier);
}

class FilterPromptWidget extends HookConsumerWidget
    implements FilterPromptCallBack {
  const FilterPromptWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);
    final filterNotifier = ref.read(filterProvider.notifier);

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
                        _buildCategoryListChip(context, filterNotifier,
                            filterState.selectedCategoryIndices),
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

  Widget _buildCategoryListChip(BuildContext context,
      FilterNotifier filterNotifier, List<int> selectedCategoryChips) {
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
          return ChoiceChip(
            label: Text(
              listCategoryChip[index],
              style: context.appTextStyles.labelMedium.copyWith(
                  color: selectedCategoryChips.contains(index)
                      ? context.appColors.onPrimary
                      : context.appColors.primary),
            ),
            selected: selectedCategoryChips.contains(index),
            onSelected: (selected) {
              filterNotifier.toggleCategoryChip(index);
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
      int selectedRateChip) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rating star",
          style: context.appTextStyles.titleMedium.bold,
        ).paddingTopSpace(SpaceType.large),
        SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ChoiceChip(
                label: Text(listRateChip[index]),
                selected: selectedRateChip == index,
                onSelected: (selected) =>
                    filterNotifier.updateRateFilter(index),
                backgroundColor: Colors.transparent,
                selectedColor: context.appColors.primary,
                shape: StadiumBorder(
                  side: BorderSide(color: context.appColors.primary),
                ),
                elevation: 0,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: listRateChip.length,
          ),
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

    print("Selected Categories: ${filterState.selectedCategoryIndices}");
    print("Selected Rate: ${filterState.selectedRateIndex}");
  }

  @override
  onReset(BuildContext context, FilterState filterState,
      FilterNotifier filterNotifier) {
    filterNotifier.resetFilters();
  }
}
