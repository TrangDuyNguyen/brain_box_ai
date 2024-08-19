import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/setting/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../providers/setting/setting_notifier.dart';
import '../../widgets/bottom_sheet.dart';

abstract class ProfileSettingContentCallback {
  onChangeTheme(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier);
  onChangeNotification(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier);
  onLogOut(BuildContext context);

  goProfile();
  goLanguage(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier);
  goCountry();
  goAboutUs();
  goCustomerService();
}

class ProfileSettingContentWidget extends HookConsumerWidget
    implements ProfileSettingContentCallback {
  const ProfileSettingContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettingState = ref.watch(settingNotifierProvider);
    final appSettingNotifier = ref.read(settingNotifierProvider.notifier);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          _buildAvatar(context),
          _buildName(context),
          _buildSetting(context, appSettingState, appSettingNotifier),
          _buildNotification(context, appSettingState, appSettingNotifier),
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
                  .copyWith(color: context.appColors.onSurface),
            ),
            Text(
              "Trangndps10349@gmail.com",
              style: context.appTextStyles.labelMedium
                  .copyWith(color: context.appColors.onSurface),
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
                context.appColors.primaryContainer, // Màu nền của nút
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

  Widget _buildSetting(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: context.appColors.surface,
          borderRadius: BorderRadius.circular(8),
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
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          GestureDetector(
            onTap: () =>
                {goLanguage(context, appSettingState, appSettingNotifier)},
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Image.asset(
                    width: 18,
                    height: 18,
                    Assets.icLanguage.path,
                    color: context.appColors.onSurface,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Languages",
                    style: context.appTextStyles.labelMedium
                        .copyWith(color: context.appColors.onSurface),
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    appSettingState.languageCode == "vi"
                        ? Assets.icFlagVn.path
                        : Assets.icFlagUsa.path,
                    //color: context.appColors.primary,
                  ),
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
          ),
          GestureDetector(
            onTap: () {
              onChangeTheme(context, appSettingState, appSettingNotifier);
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Image.asset(
                    Assets.icTheme.path,
                    width: 18,
                    height: 18,
                    color: context.appColors.onSurface,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Theme",
                    style: context.appTextStyles.labelMedium
                        .copyWith(color: context.appColors.onSurface),
                  ),
                ),
                Image.asset(
                  width: 18,
                  height: 18,
                  fit: BoxFit.fill,
                  appSettingState.theme == 'light'
                      ? Assets.icLightTheme.path
                      : Assets.icDarkTheme.path,
                  color: appSettingState.theme == 'light'
                      ? context.appColors.secondary
                      : context.appColors.onSurface,
                ),
              ],
            ).paddingTopSpace(SpaceType.medium),
          ),
        ],
      ),
    ).paddingTopSpace(SpaceType.large);
  }

  Widget _buildNotification(
    BuildContext context,
    AppSetting appSettingState,
    SettingNotifier appSettingNotifier,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: context.appColors.surface,
          borderRadius: BorderRadius.circular(8),
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
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Image.asset(
                  Assets.icNotification.path,
                  width: 18,
                  height: 18,
                  color: context.appColors.onSurface,
                ),
              ),
              Expanded(
                child: Text(
                  "Pop-up Notification",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.onSurface),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onChangeNotification(
                      context, appSettingState, appSettingNotifier);
                },
                child: Image.asset(
                  width: 36,
                  height: 36,
                  fit: BoxFit.fill,
                  !appSettingState.notificationEnabled
                      ? Assets.icSwitchOff.path
                      : Assets.icSwitchOn.path,
                  color: context.appColors.onSurface,
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
          color: context.appColors.surface,
          borderRadius: BorderRadius.circular(8),
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
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Image.asset(
                  width: 18,
                  height: 18,
                  Assets.icAboutUs.path,
                  color: context.appColors.onSurface,
                ),
              ),
              Expanded(
                child: Text(
                  "About Us",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.onSurface),
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
                      color: context.appColors.onSurface,
                    ),
                  ),
                ),
              ),
            ],
          ).paddingTopSpace(SpaceType.medium),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: Image.asset(
                  width: 18,
                  height: 18,
                  Assets.icCustomerService.path,
                  color: context.appColors.onSurface,
                ),
              ),
              Expanded(
                child: Text(
                  "Customer Service",
                  style: context.appTextStyles.labelMedium
                      .copyWith(color: context.appColors.onSurface),
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
                      color: context.appColors.onSurface,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                  child: Image.asset(
                    width: 18,
                    height: 18,
                    Assets.icLogOut.path,
                    color: context.appColors.error,
                  ),
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
  goLanguage(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      title: 'Language',
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final languageCode = index == 0 ? "vi" : "en";
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(
                            index == 0
                                ? Assets.icFlagVn.path
                                : Assets.icFlagUsa.path,
                            //color: context.appColors.primary,
                          ),
                        ),
                        Text(
                          index == 0 ? "Tiếng Việt" : "English",
                          style: context.appTextStyles.labelLarge
                              .copyWith(color: context.appColors.onSurface),
                        ).paddingLeftSpace(SpaceType.small),
                        Visibility(
                          visible: appSettingState.languageCode == languageCode,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Assets.icTick.image(
                                width: 24,
                                height: 16,
                                color: context.appColors.onSurface),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      final code = languageCode;
                      appSettingNotifier.setLanguage(code);
                      context.pop();
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
  goProfile() {
    // TODO: implement goProfile
    throw UnimplementedError();
  }

  @override
  onChangeNotification(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
    appSettingNotifier.toggleNotification(!appSettingState.notificationEnabled);
  }

  @override
  onChangeTheme(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
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
                final themeCode = index == 0 ? "light" : "dark";
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: Image.asset(
                            width: 18,
                            height: 18,
                            fit: BoxFit.fill,
                            index == 0
                                ? Assets.icLightTheme.path
                                : Assets.icDarkTheme.path,
                            color: index == 0
                                ? context.appColors.secondary
                                : context.appColors.onSurface,
                          ),
                        ),
                        Text(
                          index == 0 ? "Light" : "Dark",
                          style: context.appTextStyles.labelLarge
                              .copyWith(color: context.appColors.onSurface),
                        ),
                        Visibility(
                          visible: appSettingState.theme == themeCode,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Assets.icTick.image(
                                width: 24,
                                height: 16,
                                color: context.appColors.onSurface),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      final newTheme = index == 0 ? "light" : "dark";
                      appSettingNotifier.setUpdateTheme(newTheme);
                      context.pop();
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
