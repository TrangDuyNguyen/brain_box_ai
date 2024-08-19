import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/app_context.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/presentation/widgets/prompt_card_widget.dart';
import 'package:brain_box_ai/providers/home/state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../providers/home/home_notifier.dart';
import '../../widgets/chip_widget.dart';
import '../../widgets/shimmer_widget.dart';

final List<String> listChip = [
  "All",
  "General",
  "Gastroenteritis",
  "Cardiologist",
  "Orthopaedic",
  "Neurologist",
  "Otology",
  "Dentist",
  "Rhinology",
  "Urologist",
  "Otology",
  "Pulmonologist",
  "Neurologist",
  "Gastroenteritis"
];

abstract class HomeContentCallback {
  goViewProfile(BuildContext context);
  goNotification(BuildContext context);
  goSearch(BuildContext context);
  goFiller(BuildContext context);
  goSeeAllPromptCategory(BuildContext context);
  goListPromptCategory(BuildContext context, String category);
  goSeeAllTopPrompt(BuildContext context);
  goDetailPrompt(BuildContext context);

  onFillerTopPromptWithCategory(BuildContext context, String category);
}

class HomeContentWidget extends HookConsumerWidget
    implements HomeContentCallback {
  const HomeContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchFocusNote = useFocusNode();

    final homeState = ref.watch(homeNotifierProvider);
    final homeNotifier = ref.read(homeNotifierProvider.notifier);

    final selectedChipIndex = useState(0);

    useEffect(() {
      return null;
    }, []);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            _buildSearch(context, searchController, searchFocusNote),
            _buildCategory(context),
            _buildTopPrompt(
                context, selectedChipIndex, homeState, homeNotifier),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => {goViewProfile(context)},
          child: CircleAvatar(
            radius: 22,
            child: ClipOval(
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/dortor-appointment.appspot.com/o/avatars%2F1u68fKDq41UFBoRwABz4THmGYyH2%2F1000000062.jpg?alt=media&token=043a0847-3dda-4609-bd59-57aab76214be",
                errorBuilder: (context, error, stackTrace) {
                  return CircleAvatar(
                    radius: context.width * 0.33 / 2,
                    backgroundImage:
                        const AssetImage('lib/design/assets/icons/avatar.png'),
                  );
                },
              ),
            ),
          ).paddingRightSpace(SpaceType.small),
        ),
        GestureDetector(
          onTap: () => {goViewProfile(context)},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back,",
                style: context.appTextStyles.titleMedium
                    .copyWith(color: context.appColors.onSurface),
              ),
              Text(
                "Nguyen Duy Trang",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.onSurface),
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
        Stack(children: [
          InkWell(
            onTap: () {},
            child: ClipOval(
              child: SizedBox(
                width: 24,
                height: 24,
                child: Assets.icNoti.image(color: context.appColors.primary),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: context.appColors.error,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget _buildSearch(BuildContext context,
      TextEditingController searchController, FocusNode searchFocusNote) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: context.appColors.primaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.icSearch.image(color: context.appColors.onPrimaryContainer),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextFormField(
              controller: searchController,
              focusNode: searchFocusNote,
              enabled: false,
              onTap: () => {goSearch(context)},
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: context.appTextStyles.titleMedium.copyWith(
                      color: context.appColors.onPrimaryContainer
                          .withOpacity(0.6)),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
            child: Container(
              height: 20,
              width: 1,
              color: context.appColors.outline,
            ),
          ),
          InkWell(
            onTap: () {
              goFiller(context);
            },
            child: Assets.icFilter
                .image(color: context.appColors.onPrimaryContainer),
          )
        ],
      ),
    ).paddingTopSpace(SpaceType.large);
  }

  Widget _buildCategory(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Prompt Category",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.onSurface),
            ),
            InkWell(
              onTap: () {
                goSeeAllPromptCategory(context);
              },
              child: Text(
                "SEE ALL",
                style: context.appTextStyles.titleSmall.bold.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
              ),
            ),
          ],
        ).paddingTopSpace(SpaceType.large),
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => {goListPromptCategory(context, "category")},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: context.appColors.primaryContainer,
                      child:
                          Image.asset(Assets.icX.path, width: 30, height: 30),
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: Text(
                        "Category",
                        style: context.appTextStyles.labelLarge,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              );
            }).paddingTopSpace(SpaceType.medium),
      ],
    );
  }

  Widget _buildTopPrompt(
      BuildContext context,
      ValueNotifier<int> selectedChipIndex,
      HomeState homeState,
      HomeNotifier homeNotifier) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Prompt",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.onSurface),
            ),
            InkWell(
              onTap: () {
                goSeeAllTopPrompt(context);
              },
              child: Text(
                "SEE ALL",
                style: context.appTextStyles.titleSmall.bold
                    .copyWith(color: context.appColors.onSurface.withOpacity(0.6)),
              ),
            ),
          ],
        ).paddingTopSpace(SpaceType.large),
        ChipsHorizontalWidget(
            chipLabels: listChip,
            selectedChipIndex: selectedChipIndex.value,
            onChipSelected: (index) {
              selectedChipIndex.value = index;
              onFillerTopPromptWithCategory(context, "category");
            }),
        homeState is HomeLoading
            ? const ShimmerView().paddingTopSpace(SpaceType.medium)
            : homeState is HomeSuccess
                ? ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {goDetailPrompt(context)},
                            child: PromptCardWidget(
                              promptEntity: homeState.listPrompt[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              height: 12,
                            ),
                        itemCount: 10) //
                    .paddingTopSpace(SpaceType.medium)
                    .paddingBottomSpace(SpaceType.medium)
                : const SizedBox(),
      ],
    );
  }

  @override
  goFiller(BuildContext context) {
    // TODO: implement goFiller
    throw UnimplementedError();
  }

  @override
  goListPromptCategory(BuildContext context, String category) {
    // TODO: implement goListPromptCategory
    throw UnimplementedError();
  }

  @override
  goNotification(BuildContext context) {
    // TODO: implement goNotification
    throw UnimplementedError();
  }

  @override
  goSearch(BuildContext context) {
    // TODO: implement goSearch
    throw UnimplementedError();
  }

  @override
  goSeeAllPromptCategory(BuildContext context) {
    // TODO: implement goSeeAllPromptCategory
    throw UnimplementedError();
  }

  @override
  goViewProfile(BuildContext context) {
    // TODO: implement goViewProfile
    throw UnimplementedError();
  }

  @override
  onFillerTopPromptWithCategory(BuildContext context, String category) {
    // TODO: implement onFillerTopPromptWithCategory
    throw UnimplementedError();
  }

  @override
  goSeeAllTopPrompt(BuildContext context) {
    // TODO: implement goSeeAllTopPrompt
    throw UnimplementedError();
  }

  @override
  goDetailPrompt(BuildContext context) {
    // TODO: implement goDetailPrompt
    throw UnimplementedError();
  }
}
