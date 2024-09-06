import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/providers/search/state/search_result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utility/space_utils.dart';
import '../../../domain/entities/search/category_entity.dart';
import '../../../domain/entities/search/filter_search_entity.dart';
import '../../../domain/entities/search/search_result_param.dart';
import '../../../providers/search/filter_notifier.dart';
import '../../../providers/search/search_result_notifier.dart';
import '../../../providers/search/state/filter_state.dart';
import '../../widgets/empty_widget.dart';
import '../../widgets/prompt_card_widget.dart';
import '../../widgets/shimmer_widget.dart';

abstract class SearchResultWidgetCallBack {}

class SearchResultWidget extends HookConsumerWidget
    implements SearchResultWidgetCallBack {
  final SearchResultParam searchResultParam;
  const SearchResultWidget(this.searchResultParam, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterNotifierProvider);
    final searchResultState = ref.watch(searchResultNotifierProvider);
    final searchResultNotifier =
        ref.watch(searchResultNotifierProvider.notifier);

    useEffect(() {
      ref.listen<FilterState>(filterNotifierProvider, (previous, next) {
        final updatedParam = searchResultParam.copyWith(
          filterSearch: FilterSearchEntity(
            selectedCategoryIndices: next.selectedCategoryIndices,
            selectedRateIndex: next.selectedRateIndex,
          ),
        );
        searchResultNotifier.onSearchResult(updatedParam);
      });

      Future.microtask(() => searchResultNotifier.onSearchResult(searchResultParam));
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFilter(context, filterState)
            .paddingHorizontalSpace(SpaceType.medium),
        Text(
          "Search result",
          style: context.appTextStyles.titleMedium.bold
              .copyWith(color: context.appColors.onSurface),
        )
            .paddingHorizontalSpace(SpaceType.medium)
            .paddingTopSpace(SpaceType.medium),
        Expanded(
          child: _buildListResult(context, searchResultState),
        ),
      ],
    );
  }

  Widget _buildFilter(BuildContext context, FilterState filterState) {
    List<CategoryEntity> listFilter = filterState.selectedCategoryIndices;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Filter",
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface)),
        Wrap(
          spacing: 8.0,
          runSpacing: 0,
          children: List<Widget>.generate(listFilter.length, (int index) {
            var filter = listFilter[index];
            return ChoiceChip(
              label: Text(
                filter.name,
                style: context.appTextStyles.labelMedium
                    .copyWith(color: context.appColors.onPrimaryContainer),
              ),
              selected: true,
              onSelected: (selected) {},
              backgroundColor: Colors.transparent,
              selectedColor: context.appColors.primaryContainer,
              shape: StadiumBorder(
                side: BorderSide(color: context.appColors.primaryContainer),
              ),
              elevation: 0,
            );
          }).toList(),
        ).paddingTopSpace(SpaceType.small),
        ChoiceChip(
          label: Text(
            filterState.selectedRateIndex.name,
            style: context.appTextStyles.labelMedium
                .copyWith(color: context.appColors.onSecondaryContainer),
          ),
          selected: true,
          onSelected: (selected) {},
          backgroundColor: Colors.transparent,
          selectedColor: context.appColors.secondaryContainer,
          shape: StadiumBorder(
            side: BorderSide(color: context.appColors.secondaryContainer),
          ),
          elevation: 0,
        ),
      ],
    ).paddingTopSpace(SpaceType.medium);
  }
}

Widget _buildListResult(
    BuildContext context, SearchResultState searchResultState) {
  return searchResultState is SearchResultLoading
      ? const ShimmerView().paddingTopSpace(SpaceType.medium)
      : searchResultState is SearchPromptResultSuccess
          ? ListView.separated(
              padding: const EdgeInsets.all(16.0),
              itemCount: searchResultState.listResult.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                var prompt = searchResultState.listResult[index];
                return GestureDetector(
                  onTap: () {},
                  child: PromptCardWidget(
                    promptEntity: prompt,
                  ),
                );
              },
            )
          : const Center(child: EmptyWidget());
}
