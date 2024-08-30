import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/data/datasources/dummy_data/dummy_data.dart';
import 'package:brain_box_ai/domain/entities/search/category_entity.dart';
import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';
import '../../../providers/search/filter_notifier.dart';

abstract class SearchPromptWidgetCallBack {
  void goFilter(BuildContext context);
  void goSearchPromptResult(BuildContext context,
      TextEditingController searchController, String text);
  void onSearch(BuildContext context);
  void pasteOnSearchBar(BuildContext context, String text,
      TextEditingController searchController, ValueNotifier<bool> isSearchOpen);
}

class SearchPromptWidget extends HookConsumerWidget
    implements SearchPromptWidgetCallBack {
  const SearchPromptWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(filterProvider);

    final searchController = useTextEditingController();
    final searchFocusNode = useFocusNode();
    final isSearchOpen = useState(false);
    final listSearchHistory = useState(searchHistory);
    final listSearchResult = useState(searchResult);

    final isSearchFocused = useState(false);
    searchFocusNode.addListener(() {
      isSearchFocused.value = searchFocusNode.hasFocus;
    });

    return Scaffold(
      appBar: _buildAppBar(
          context, isSearchOpen, searchController, searchFocusNode),
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
                  ? _buildSearchResult(
                      context, listSearchResult, searchController)
                  : _buildSearchHistory(context, listSearchHistory,
                      searchController, isSearchOpen),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, ValueNotifier<bool> isSearchOpen,
      TextEditingController searchController, FocusNode searchFocusNode) {
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
            ? _buildSearchBar(context, searchController, searchFocusNode,
                key: const ValueKey('SearchBar'))
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
        InkWell(
          onTap: () {
            goFilter(context);
          },
          child: Assets.icFilter
              .image(width: 24, height: 24, color: context.appColors.onSurface),
        ).paddingRightSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context,
      TextEditingController searchController, FocusNode searchFocusNode,
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
          onSearch(context);
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
      ValueNotifier<List<String>> listSearchHistory,
      TextEditingController searchController,
      ValueNotifier<bool> isSearchOpen) {
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
                  var item = listSearchHistory.value[index];
                  return _buildSearchItem(context,
                      item: item,
                      onTap: () {
                        isSearchOpen.value = true;
                        return goSearchPromptResult(
                            context, searchController, item);
                      },
                      onPaste: () => pasteOnSearchBar(
                          context, item, searchController, isSearchOpen),
                      onDismissed: () {
                        listSearchHistory.value =
                            List.from(listSearchHistory.value)..removeAt(index);
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
                itemCount: listSearchHistory.value.length)
            .paddingTopSpace(SpaceType.medium)
            .paddingBottomSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildSearchResult(
      BuildContext context,
      ValueNotifier<List<String>> listSearchResult,
      TextEditingController searchController) {
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
                  var item = listSearchResult.value[index];
                  return _buildSearchItem(
                    context,
                    item: item,
                    onTap: () =>
                        goSearchPromptResult(context, searchController, item),
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
                itemCount: listSearchResult.value.length)
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
  void goFilter(BuildContext context) {}

  @override
  void goSearchPromptResult(BuildContext context,
      TextEditingController searchController, String text) {
    searchController.text = text;
  }

  @override
  void onSearch(BuildContext context) {}

  @override
  void pasteOnSearchBar(
      BuildContext context,
      String text,
      TextEditingController searchController,
      ValueNotifier<bool> isSearchOpen) {
    searchController.text = text;
    isSearchOpen.value = true;
    onSearch(context);
  }
}
