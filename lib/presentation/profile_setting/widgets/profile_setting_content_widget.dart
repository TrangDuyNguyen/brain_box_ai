import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../widgets/bottom_sheet.dart';

abstract class ProfileSettingContentCallback {
  onChangeTheme(BuildContext context, ValueNotifier<bool> isLightTheme);
  onChangeNotification(
      BuildContext context, ValueNotifier<bool> isNotification);
  onLogOut(BuildContext context);

  goProfile();
  goLanguage();
  goCountry();
  goAboutUs();
  goCustomerService();
}

class ProfileSettingContentWidget extends HookConsumerWidget
    implements ProfileSettingContentCallback {
  const ProfileSettingContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isNotification = useState(true);
    var isLightTheme = useState(true);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          _buildAvatar(context),
          _buildName(context),
          _buildSetting(context, isLightTheme),
          _buildNotification(context, isNotification),
          _buildOtherSetting(context),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 44, // Set the radius to 28 to make the diameter 56
          backgroundColor: context.appColors.primary,
          child: CircleAvatar(
            radius: 44,
            child: ClipOval(
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/dortor-appointment.appspot.com/o/avatars%2F1u68fKDq41UFBoRwABz4THmGYyH2%2F1000000062.jpg?alt=media&token=043a0847-3dda-4609-bd59-57aab76214be",
                errorBuilder: (context, error, stackTrace) {
                  return const CircleAvatar(
                    radius: 44,
                    backgroundImage:
                        AssetImage('lib/design/assets/icons/avatar.png'),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ).paddingVerticalSpace(SpaceType.large);
  }

  Widget _buildName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nguyen Duy Trang",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.primary),
            ),
            Text(
              "Trangndps10349@gmail.com",
              style: context.appTextStyles.labelMedium
                  .copyWith(color: context.appColors.primary),
            ),
          ],
        ),
        const Expanded(child: SizedBox.shrink()),
        ElevatedButton(
          onPressed: () {
            // Xử lý sự kiện đặt lại

          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
            context.appColors.primary, // Màu nền của nút
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(
            'Edit',
            style: context.appTextStyles.labelMedium.bold
                .copyWith(color: context.appColors.onPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildSetting(BuildContext context, ValueNotifier<bool> isLightTheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: context.appColors.onPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.appColors.outline,
              spreadRadius: 0.2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: context.appTextStyles.titleMedium.bold,
          ),
          Row(
            children: [
              Image.asset(Assets.icLanguage.path),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Languages",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.secondary),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ClipOval(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      Assets.icArowRight.path,
                      color: context.appColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingTopSpace(SpaceType.medium),
          Row(
            children: [
              Image.asset(
                Assets.icLocation.path,
                color: context.appColors.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Country",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.secondary),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ClipOval(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      Assets.icArowRight.path,
                      color: context.appColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingTopSpace(SpaceType.medium),
          GestureDetector(
            onTap: () {
              onChangeTheme(context, isLightTheme);
            },
            child: Row(
              children: [
                Image.asset(
                  Assets.icTheme.path,
                  color: context.appColors.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Theme",
                    style: context.appTextStyles.labelMedium
                        .copyWith(color: context.appColors.secondary),
                  ),
                ),
                Image.asset(
                  width: 24,
                  height: 24,
                  fit: BoxFit.fill,
                  isLightTheme.value
                      ? Assets.icLightTheme.path
                      : Assets.icDarkTheme.path,
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
          ),
        ],
      ),
    ).paddingTopSpace(SpaceType.large);
  }

  Widget _buildNotification(
      BuildContext context, ValueNotifier<bool> isNotification) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: context.appColors.onPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.appColors.outline,
              spreadRadius: 0.2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Notification",
            style: context.appTextStyles.titleMedium.bold,
          ),
          Row(
            children: [
              Image.asset(
                Assets.icNotification.path,
                color: context.appColors.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Pop-up Notification",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.secondary),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onChangeNotification(context, isNotification);
                },
                child: Image.asset(
                  width: 36,
                  height: 36,
                  fit: BoxFit.fill,
                  isNotification.value
                      ? Assets.icSwitchOff.path
                      : Assets.icSwitchOn.path,
                ),
              ),
            ],
          ).paddingTopSpace(SpaceType.medium),
        ],
      ),
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildOtherSetting(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: context.appColors.onPrimary,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: context.appColors.outline,
              spreadRadius: 0.2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Others",
            style: context.appTextStyles.titleMedium.bold,
          ),
          Row(
            children: [
              Image.asset(
                Assets.icAboutUs.path,
                color: context.appColors.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "About Us",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.secondary),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ClipOval(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      Assets.icArowRight.path,
                      color: context.appColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingTopSpace(SpaceType.medium),
          Row(
            children: [
              Image.asset(
                Assets.icCustomerService.path,
                color: context.appColors.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  "Customer Service",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.secondary),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ClipOval(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      Assets.icArowRight.path,
                      color: context.appColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingTopSpace(SpaceType.medium),
          GestureDetector(
            onTap: () => {onLogOut(context)},
            child: Row(
              children: [
                Image.asset(
                  Assets.icLogOut.path,
                  color: context.appColors.error,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    "Logout",
                    style: context.appTextStyles.labelMedium
                        .copyWith(color: context.appColors.error),
                  ),
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
          ),
        ],
      ),
    ).paddingTopSpace(SpaceType.medium);
  }

  @override
  goAboutUs() {
    // TODO: implement goAboutUs
    throw UnimplementedError();
  }

  @override
  goCountry() {
    // TODO: implement goCountry
    throw UnimplementedError();
  }

  @override
  goCustomerService() {
    // TODO: implement goCustomerService
    throw UnimplementedError();
  }

  @override
  goLanguage() {
    // TODO: implement goLanguage
    throw UnimplementedError();
  }

  @override
  goProfile() {
    // TODO: implement goProfile
    throw UnimplementedError();
  }

  @override
  onChangeNotification(
      BuildContext context, ValueNotifier<bool> isNotification) {
    isNotification.value = !isNotification.value;
  }

  @override
  onChangeTheme(BuildContext context, ValueNotifier<bool> isLightTheme) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      title: 'Theme',
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          index == 0 ? "Light" : "Dark",
                          style: context.appTextStyles.labelLarge,
                        ),
                      ],
                    ),
                    onTap: () => {
                      // Change state topic
                      if (index == 0)
                        {isLightTheme.value = true}
                      else
                        {isLightTheme.value = false},
                      context.pop()
                    },
                  ),
                );
              },
            )),
      ),
      scrollable: false,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      isCustomSizeWithKeyBoard: true,
    );
  }

  @override
  onLogOut(BuildContext context) {
    context.go(RouterPath.authPage.getPath);
  }
}
