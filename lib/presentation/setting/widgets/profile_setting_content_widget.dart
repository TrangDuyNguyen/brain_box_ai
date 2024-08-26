import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/setting/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/theme/theme_color_option.dart';
import '../../../providers/setting/setting_notifier.dart';
import '../../widgets/bottom_sheet.dart';

abstract class ProfileSettingContentCallback {
  onChangeThemeMode(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier);

  onChangeThemeColor(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier);

  onChangeNotification(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier);

  onLogOut(BuildContext context);

  goProfile(BuildContext context);
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
          _buildNameSection(context),
          _buildSettingSection(context, appSettingState, appSettingNotifier),
          _buildNotificationSection(
              context, appSettingState, appSettingNotifier),
          _buildOtherSettingsSection(context),
        ],
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 44,
          backgroundColor: context.appColors.primary,
          child: CircleAvatar(
            radius: 44,
            child: ClipOval(
              child: Image.network(
                "https://thispersondoesnotexist.com",
                errorBuilder: (context, error, stackTrace) {
                  return CircleAvatar(
                    radius: 44,
                    backgroundImage: AssetImage(Assets.icAvatar.path),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ).paddingVerticalSpace(SpaceType.large);
  }

  Widget _buildNameSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildUserInfo(context),
        ElevatedButton(
          onPressed: () {
            goProfile(context);
          },
          style: _editButtonStyle(context),
          child: Text(
            'Edit',
            style: context.appTextStyles.labelMedium.bold
                .copyWith(color: context.appColors.onPrimary),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Column(
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
    );
  }

  ButtonStyle _editButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      backgroundColor: context.appColors.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildSettingSection(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
    return _buildSettingContainer(
      context,
      children: [
        _buildSectionTitle(context, "Settings"),
        _buildSettingOption(
          context,
          iconPath: Assets.icLanguage.path,
          label: "Languages",
          trailingWidget: _buildLanguageIcon(appSettingState),
          onTap: () => goLanguage(context, appSettingState, appSettingNotifier),
        ),
        _buildSettingOption(
          context,
          iconPath: Assets.icTheme.path,
          label: "Theme mode",
          trailingWidget: _buildThemeIcon(context, appSettingState),
          onTap: () =>
              onChangeThemeMode(context, appSettingState, appSettingNotifier),
        ),
        _buildSettingOption(
          context,
          iconPath: Assets.icThemeColor.path,
          label: "Theme color",
          trailingWidget: _buildThemeColorPreview(
                  context,
                  context.appColors.primary,
                  context.appColors.secondary,
                  context.appColors.primaryContainer,
                  context.appColors.secondaryContainer)
              .paddingTopSpace(SpaceType.medium),
          onTap: () =>
              onChangeThemeColor(context, appSettingState, appSettingNotifier),
        ),
      ],
    );
  }

  Widget _buildNotificationSection(
    BuildContext context,
    AppSetting appSettingState,
    SettingNotifier appSettingNotifier,
  ) {
    return _buildSettingContainer(
      context,
      children: [
        _buildSectionTitle(context, "Notification"),
        _buildSettingOption(
          context,
          iconPath: Assets.icNotification.path,
          label: "Pop-up Notification",
          trailingWidget: _buildNotificationSwitch(
              context, appSettingState, appSettingNotifier),
          onTap: () => onChangeNotification(
              context, appSettingState, appSettingNotifier),
        ),
      ],
    );
  }

  Widget _buildOtherSettingsSection(BuildContext context) {
    return _buildSettingContainer(
      context,
      children: [
        _buildSectionTitle(context, "Others"),
        _buildOtherSettingOption(context, "About Us", Assets.icAboutUs.path,
            onTap: goAboutUs),
        _buildOtherSettingOption(
            context, "Customer Service", Assets.icCustomerService.path,
            onTap: goCustomerService),
        _buildOtherSettingOption(context, "Logout", Assets.icLogOut.path,
            onTap: () => onLogOut(context), isError: true),
      ],
    );
  }

  Widget _buildSettingContainer(BuildContext context,
      {required List<Widget> children}) {
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
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ).paddingTopSpace(SpaceType.large);
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: context.appTextStyles.titleMedium.bold
          .copyWith(color: context.appColors.onSurface),
    );
  }

  Widget _buildSettingOption(
    BuildContext context, {
    required String iconPath,
    required String label,
    required Widget trailingWidget,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Image.asset(
              iconPath,
              width: 18,
              height: 18,
              color: context.appColors.onSurface,
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: context.appTextStyles.labelMedium
                  .copyWith(color: context.appColors.onSurface),
            ),
          ),
          trailingWidget,
        ],
      ).paddingTopSpace(SpaceType.medium),
    );
  }

  Widget _buildOtherSettingOption(
      BuildContext context, String label, String iconPath,
      {required VoidCallback onTap, bool isError = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
            child: Image.asset(
              iconPath,
              width: 18,
              height: 18,
              color: isError
                  ? context.appColors.error
                  : context.appColors.onSurface,
            ),
          ),
          Expanded(
            child: Text(
              label,
              style: context.appTextStyles.labelMedium.copyWith(
                  color: isError
                      ? context.appColors.error
                      : context.appColors.onSurface),
            ),
          ),
        ],
      ).paddingTopSpace(SpaceType.medium),
    );
  }

  Widget _buildLanguageIcon(AppSetting appSettingState) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Image.asset(
        appSettingState.languageCode == "vi"
            ? Assets.icFlagVn.path
            : Assets.icFlagUsa.path,
      ),
    );
  }

  Widget _buildThemeIcon(BuildContext context, AppSetting appSettingState) {
    return Image.asset(
      width: 18,
      height: 18,
      fit: BoxFit.fill,
      appSettingState.theme == 'light'
          ? Assets.icLightTheme.path
          : Assets.icDarkTheme.path,
      color: appSettingState.theme == 'light'
          ? context.appColors.secondary
          : context.appColors.onSurface,
    );
  }

  Widget _buildThemeColorPreview(BuildContext context, Color primary,
      Color secondary, Color primaryContainer, Color secondaryContainer) {
    return Container(
      width: 40,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Ngăn 3 - Tertiary Color
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryContainer,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4), // Bo góc trái dưới
                      ),
                    ),
                  ),
                ),
                // Ngăn 4 - Surface Color
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: secondaryContainer,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(4), // Bo góc phải dưới
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSwitch(BuildContext context,
      AppSetting appSettingState, SettingNotifier appSettingNotifier) {
    return Switch.adaptive(
      value: appSettingState.notificationEnabled,
      onChanged: (value) =>
          onChangeNotification(context, appSettingState, appSettingNotifier),
      activeColor: context.appColors.primary,
    );
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
  goProfile(BuildContext context) {
    context.push(RouterPath.profile.getPath);
  }

  @override
  onChangeNotification(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
    appSettingNotifier.toggleNotification(!appSettingState.notificationEnabled);
  }

  @override
  onChangeThemeMode(BuildContext context, AppSetting appSettingState,
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
  onChangeThemeColor(BuildContext context, AppSetting appSettingState,
      SettingNotifier appSettingNotifier) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      title: 'Theme Color',
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: themeColorOptions.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final themeMode = appSettingState.theme;
                final themeColor = themeColorOptions[index];
                final colors = themeMode == "light"
                    ? themeColor.themeDataLight.colorScheme
                    : themeColor.themeDataDark.colorScheme;
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildThemeColorPreview(
                            context,
                            colors.primary,
                            colors.secondary,
                            colors.primaryContainer,
                            colors.secondaryContainer),
                        Text(
                          themeColor.name,
                          style: context.appTextStyles.labelLarge
                              .copyWith(color: context.appColors.onSurface),
                        ).paddingLeftSpace(SpaceType.medium),
                        Visibility(
                          visible: appSettingState.selectedThemeColorId ==
                              themeColor.id,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Assets.icTick.image(
                                width: 24,
                                height: 16,
                                color: context.appColors.onSurface),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    onTap: () {
                      final newThemeColor = themeColor.id;
                      appSettingNotifier.setUpdateThemeColor(newThemeColor);
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
