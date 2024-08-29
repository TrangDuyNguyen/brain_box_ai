import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/data/datasources/dummy_data/dummy_data.dart';
import 'package:brain_box_ai/domain/entities/search/category_entity.dart';
import 'package:brain_box_ai/providers/search/state/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';
import '../../../providers/search/filter_notifier.dart';

abstract class SearchPromptWidgetCallBack {
  goFilter(BuildContext context);
  goDetailPrompt(context);

  onSearch(BuildContext context);
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

    return Scaffold(
      appBar: _buildAppBar(
          context, isSearchOpen, searchController, searchFocusNode),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilter(context, filterState),
            _buildSearchHistory(context, listSearchHistory),
            _buildSearchContent(context),
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
      BuildContext context, ValueNotifier<List<String>> listSearchHistory) {
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
                  return Dismissible(
                    key: Key(item),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      listSearchHistory.value =
                          List.from(listSearchHistory.value)..removeAt(index);
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: context.appColors.error,
                      child: Assets.icClose.image(
                          width: 24,
                          height: 24,
                          color: context.appColors.onTertiary),
                    ),
                    child: GestureDetector(
                      onTap: () => {goDetailPrompt(context)},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: context.appColors.tertiaryContainer,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item,
                              style: context.appTextStyles.labelMedium
                                  .copyWith(color: context.appColors.onSurface),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
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

  Widget _buildSearchContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Result",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.onSurface))
            .paddingTopSpace(SpaceType.medium),
      ],
    );
  }

  @override
  goFilter(BuildContext context) {
    context.push(RouterPath.filter.getPath);
  }

  @override
  onSearch(BuildContext context) {
    // TODO: implement onSearch
    throw UnimplementedError();
  }

  @override
  goDetailPrompt(context) {
    // TODO: implement goDetailPrompt
    throw UnimplementedError();
  }
}
