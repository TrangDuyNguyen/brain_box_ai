import 'dart:convert';

import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/search/category_entity.dart';
import 'package:brain_box_ai/providers/search/search_notifier.dart';
import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:brain_box_ai/providers/search/state/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../domain/entities/search/filter_search_entity.dart';
import '../../../domain/entities/search/search_entity.dart';
import '../../../domain/entities/search/search_result_param.dart';
import '../../../providers/search/filter_notifier.dart';

abstract class SearchWidgetCallBack {
  void goFilter(BuildContext context);
  void goSearchPromptResult(BuildContext context, SearchNotifier searchNotifier,
      FilterState filterState, String text);
  void onSearchResult(
      BuildContext context, String text, SearchNotifier searchNotifier);
  void pasteOnSearchBar(BuildContext context, String text,
      TextEditingController searchController, ValueNotifier<bool> isSearchOpen);
}

class SearchWidget extends HookConsumerWidget implements SearchWidgetCallBack {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterNotifierProvider);

    final searchState = ref.watch(searchNotifierProvider);
    final searchNotifier = ref.watch(searchNotifierProvider.notifier);

    final searchController = useTextEditingController();

    final searchFocusNode = useFocusNode();

    final isSearchOpen = useState(false);
    isSearchOpen.addListener(() {
      if (isSearchOpen.value == false) {
        searchNotifier.getListSearchHistory();
      }
    });

    final isSearchFocused = useState(false);
    searchFocusNode.addListener(() {
      isSearchFocused.value = searchFocusNode.hasFocus;
    });

    return Scaffold(
      appBar: _buildAppBar(context, isSearchOpen, searchController,
          searchFocusNode, searchNotifier, filterState),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilter(context, filterState),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: isSearchFocused.value
                  ? searchState is SearchResultSuccess
                      ? _buildSearchResult(
                          context,
                          searchState.listSearchResult,
                          searchController,
                          searchNotifier,
                          filterState)
                      : const SizedBox()
                  : searchState is SearchHistorySuccess
                      ? _buildSearchHistory(
                          context,
                          searchState.listSearchHistory,
                          searchController,
                          isSearchOpen,
                          searchNotifier,
                          filterState)
                      : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(
    BuildContext context,
    ValueNotifier<bool> isSearchOpen,
    TextEditingController searchController,
    FocusNode searchFocusNode,
    SearchNotifier searchNotifier,
    FilterState filterState,
  ) {
    return AppBar(
      centerTitle: true,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          final inAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);

          final outAnimation = Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-1.0, 0.0),
          ).animate(animation);

          if (child.key == const ValueKey('SearchBar')) {
            return SlideTransition(position: inAnimation, child: child);
          } else {
            //const ValueKey('Title')
            return SlideTransition(position: outAnimation, child: child);
          }
        },
        child: isSearchOpen.value
            ? _buildSearchBar(
                context,
                searchController,
                searchFocusNode,
                key: const ValueKey('SearchBar'),
                searchNotifier)
            : Text(
                "Search Prompt",
                key: const ValueKey('Title'),
                style: context.appTextStyles.titleMedium
                    .copyWith(color: context.appColors.onSurface),
              ),
      ),
      leading: isSearchOpen.value
          ? IconButton(
              icon: Icon(
                Icons.close,
                color: context.appColors.onSurface,
              ),
              onPressed: () {
                isSearchOpen.value = false;
                searchController.clear();
                searchFocusNode.unfocus();
              },
            )
          : null,
      actions: [
        if (!isSearchOpen.value)
          InkWell(
            onTap: () {
              isSearchOpen.value = true;
              searchFocusNode.requestFocus();
            },
            child: Assets.icSearch.image(
                width: 24, height: 24, color: context.appColors.onSurface),
          ).paddingRightSpace(SpaceType.medium),
        if (!isSearchOpen.value)
          InkWell(
            onTap: () {
              goFilter(context);
            },
            child: Assets.icFilter.image(
                width: 24, height: 24, color: context.appColors.onSurface),
          ).paddingRightSpace(SpaceType.medium),
        if (isSearchOpen.value)
          TextButton(
              onPressed: () => {
                    goSearchPromptResult(context, searchNotifier, filterState,
                        searchController.text)
                  },
              child: Text(
                "Search",
                style: context.appTextStyles.titleMedium
                    .copyWith(color: context.appColors.onSurface),
              )).paddingRightSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildSearchBar(
      BuildContext context,
      TextEditingController searchController,
      FocusNode searchFocusNode,
      SearchNotifier searchNotifier,
      {required ValueKey<String> key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(28),
      ),
      child: TextField(
        controller: searchController,
        focusNode: searchFocusNode,
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          hintStyle: context.appTextStyles.titleMedium
              .copyWith(color: context.appColors.onSurfaceVariant),
        ),
        style: context.appTextStyles.titleMedium
            .copyWith(color: context.appColors.onSurface),
        onSubmitted: (query) {
          onSearchResult(context, query, searchNotifier);
        },
        onChanged: (query) {
          searchNotifier.onSearch(query);
        },
      ),
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

  Widget _buildSearchHistory(
      BuildContext context,
      List<SearchEntity> listSearchHistory,
      TextEditingController searchController,
      ValueNotifier<bool> isSearchOpen,
      SearchNotifier searchNotifier,
      FilterState filterState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("History",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.onSurface))
            .paddingTopSpace(SpaceType.medium),
        ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = listSearchHistory[index];
                  return _buildSearchItem(context,
                      item: item.result,
                      onTap: () {
                        isSearchOpen.value = true;
                        return goSearchPromptResult(
                            context, searchNotifier, filterState, item.result);
                      },
                      onPaste: () => pasteOnSearchBar(
                          context, item.result, searchController, isSearchOpen),
                      onDismissed: () {
                        // listSearchHistory.value =
                        //     List.from(listSearchHistory.value)..removeAt(index);
                      },
                      leftIcon: Assets.icHistory.image(
                          width: 18,
                          height: 18,
                          color: context.appColors.onSurface),
                      rightIcon: Assets.icArrowUp.image(
                          width: 18,
                          height: 18,
                          color: context.appColors.onSurface));
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: listSearchHistory.length)
            .paddingTopSpace(SpaceType.medium)
            .paddingBottomSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildSearchResult(
      BuildContext context,
      List<SearchEntity> listSearchResult,
      TextEditingController searchController,
      SearchNotifier searchNotifier,
      FilterState filterState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Search Results",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.onSurface))
            .paddingTopSpace(SpaceType.medium),
        ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var item = listSearchResult[index];
                  return _buildSearchItem(
                    context,
                    item: item.result,
                    onTap: () => goSearchPromptResult(
                        context, searchNotifier, filterState, item.result),
                    onPaste: () {},
                    onDismissed: () {},
                    leftIcon: Assets.icSearch.image(
                        width: 18,
                        height: 18,
                        color: context.appColors.onSurface),
                    rightIcon: const SizedBox(),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: listSearchResult.length)
            .paddingTopSpace(SpaceType.medium)
            .paddingBottomSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildSearchItem(BuildContext context,
      {required String item,
      required VoidCallback onTap,
      required VoidCallback onPaste,
      required VoidCallback onDismissed,
      required Widget leftIcon,
      required Widget rightIcon}) {
    return Dismissible(
      key: Key(item),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.appColors.errorContainer,
        child: Icon(
          Icons.delete,
          color: context.appColors.onErrorContainer,
        ),
      ),
      onDismissed: (direction) {
        onDismissed();
      },
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: leftIcon,
            ),
            Expanded(
              child: Text(
                item,
                style: context.appTextStyles.titleMedium
                    .copyWith(color: context.appColors.onSurface),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: onPaste,
              child: rightIcon,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void goFilter(BuildContext context) {
    context.push(RouterPath.filter.getPath);
  }

  @override
  void goSearchPromptResult(BuildContext context, SearchNotifier searchNotifier,
      FilterState filterState, String text) {
    SearchResultParam searchResultParam = SearchResultParam(
        text: text,
        filterSearch: FilterSearchEntity(
            selectedCategoryIndices: filterState.selectedCategoryIndices,
            selectedRateIndex: filterState.selectedRateIndex));

    String jsonString = jsonEncode(searchResultParam.toJson());

    context.push(RouterPath.searchResult.getPath, extra: jsonString);
  }

  @override
  void onSearchResult(
      BuildContext context, String text, SearchNotifier searchNotifier) {
    searchNotifier.onSearch(text);
  }

  @override
  void pasteOnSearchBar(
      BuildContext context,
      String text,
      TextEditingController searchController,
      ValueNotifier<bool> isSearchOpen) {
    searchController.text = text;
    isSearchOpen.value = true;
  }
}
