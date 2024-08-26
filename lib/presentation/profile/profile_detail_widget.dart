import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/app_context.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/domain/entities/profile/profile_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../assets/assets.gen.dart';
import '../../core/utility/date_utils.dart';
import '../../providers/profile/profile_notifier.dart';
import '../../providers/profile/state/update_profile_state.dart';
import '../widgets/bottom_sheet.dart';

abstract class ProfileDetailWidgetCallBack {
  onUpdateProfile(
      BuildContext context,
      TextEditingController mNameTextController,
      TextEditingController mBirthDayTextController,
      TextEditingController mEmailTextController,
      TextEditingController mPhoneController,
      TextEditingController mGenderTextController,
      ProfileState profileState,
      ProfileNotifier profileNotifier);
  onUpdateAvatar(BuildContext context);
}

class ProfileDetailWidget extends HookConsumerWidget
    implements ProfileDetailWidgetCallBack {
  final GlobalKey<FormState> _mFormKey = GlobalKey<FormState>();

  ProfileDetailWidget({super.key});

  @override
  onUpdateAvatar(BuildContext context) {
    // TODO: implement onUpdateAvatar
    throw UnimplementedError();
  }

  @override
  onUpdateProfile(
      BuildContext context,
      TextEditingController mNameTextController,
      TextEditingController mBirthDayTextController,
      TextEditingController mEmailTextController,
      TextEditingController mPhoneController,
      TextEditingController mGenderTextController,
      ProfileState profileState,
      ProfileNotifier profileNotifier) {
    // TODO: implement onUpdateProfile
    profileNotifier.updateProfile();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);
    final profileNotifier = ref.read(profileNotifierProvider.notifier);

    // Text controllers
    final mNameTextController = useTextEditingController();
    final mBirthDayTextController = useTextEditingController();
    final mEmailTextController = useTextEditingController();
    final mPhoneController = useTextEditingController();
    final mGenderTextController = useTextEditingController();

    // Effect to update the text controllers when profile is fetched
    useEffect(() {
      if (profileState is ProfileSuccess) {
        final profile = profileState.profileEntity;
        mNameTextController.text = profile.fullName;
        mBirthDayTextController.text =
            FormatDateUtils.formatDate(profile.birthdate);
        mEmailTextController.text = profile.email;
        mPhoneController.text = profile.phoneNumber;
        mGenderTextController.text = profile.gender;
      }
      return null;
    }, [profileState]);

    // UI Rendering
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: context.height - context.bottomSpacer,
        child: Column(
          children: [
            _buildAvatar(context, profileState),
            _buildForm(
              context,
              mNameTextController,
              mBirthDayTextController,
              mEmailTextController,
              mPhoneController,
              mGenderTextController,
              profileState,
              profileState is ProfileSuccess
                  ? profileState.profileEntity
                  : null,
            ),
            _buildStateLoading(context, profileState),
            const Spacer(),
            _buildButton(
                context,
                mNameTextController,
                mBirthDayTextController,
                mEmailTextController,
                mPhoneController,
                mGenderTextController,
                profileState,
                profileNotifier),
            SizedBox(
              height: context.bottomSpacer,
            )
          ],
        ),
      ),
    );
  }

  ///Widget

  Widget _buildAvatar(BuildContext context, ProfileState profileState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            _bottomSheetChooseImage(context);
          },
          child: CircleAvatar(
            radius: 44,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: profileState is ProfileSuccess
                    ? profileState.profileEntity.avatarUrl
                    : "",
                errorWidget: (context, url, error) => CircleAvatar(
                  radius: 44,
                  backgroundImage: AssetImage(Assets.icAvatar.path),
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ).paddingVerticalSpace(SpaceType.large);
  }

  Widget _buildForm(
      BuildContext context,
      TextEditingController mNameTextController,
      TextEditingController mBirthDayTextController,
      TextEditingController mEmailTextController,
      TextEditingController mPhoneController,
      TextEditingController mGenderTextController,
      Object? profileState,
      ProfileEntity? profile) {
    return Form(
        key: _mFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: mNameTextController,
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.onSurface),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                fillColor: context.appColors.surfaceContainerHighest,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: "Full Name",
                hintStyle: context.appTextStyles.labelLarge.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
                labelStyle: context.appTextStyles.labelLarge
                    .copyWith(color: context.appColors.onSurface),
              ),
            ).paddingBottomSpace(SpaceType.medium),
            TextFormField(
              controller: mBirthDayTextController,
              readOnly: true,
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.onSurface),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: context.appColors.surfaceContainerHighest,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ClipOval(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        Assets.icCalendar.path,
                        color: context.appColors.onSurface,
                      ),
                    ),
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: "Birth day",
                hintStyle: context.appTextStyles.labelLarge.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
              ),
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: profile?.birthdate,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (selectedDate != null) {
                  mBirthDayTextController.text =
                      FormatDateUtils.formatDate(selectedDate);
                }
              },
            ).paddingBottomSpace(SpaceType.medium),
            TextFormField(
              controller: mEmailTextController,
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.onSurface),
              decoration: InputDecoration(
                filled: true,
                // Bật màu nền
                fillColor: context.appColors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: "Email",
                hintStyle: context.appTextStyles.labelLarge.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
              ),
            ).paddingBottomSpace(SpaceType.medium),
            TextFormField(
              controller: mGenderTextController,
              readOnly: true,
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.onSurface),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: context.appColors.surfaceContainerHighest,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                hintText: "Gender",
                hintStyle: context.appTextStyles.labelLarge.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
              ),
              onTap: () async {
                _bottomSheetChooseGender(context, mGenderTextController);
              },
            ).paddingBottomSpace(SpaceType.medium),
          ],
        )).paddingTopSpace(SpaceType.large);
  }

  Widget _buildStateLoading(BuildContext context, ProfileState profileState) {
    return profileState is ProfileLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(context.appColors.primary),
            ).paddingBottomSpace(SpaceType.medium),
          )
        : profileState is ProfileError
            ? Text(
                profileState.toString(),
                style: context.appTextStyles.titleSmall
                    .copyWith(color: context.appColors.error),
              )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium)
            : const SizedBox();
  }

  Widget _buildButton(
      BuildContext context,
      TextEditingController mNameTextController,
      TextEditingController mBirthDayTextController,
      TextEditingController mEmailTextController,
      TextEditingController mPhoneController,
      TextEditingController mGenderTextController,
      ProfileState profileState,
      ProfileNotifier profileNotifier) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: context.appColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.primary, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Update",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onPrimary),
      ),
    );
  }

  /// Function
  void _bottomSheetChooseImage(BuildContext context) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      title: 'Choose Avatar',
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Column(
                  children: [
                    Text(
                      index == 0 ? "Camera" : "Photo",
                      style: context.appTextStyles.labelLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
                onTap: () async {
                  ImageSource source =
                      index == 0 ? ImageSource.camera : ImageSource.gallery;
                  XFile? croppedFile = await _pickImage(source);
                  if (croppedFile != null) {
                    // Xử lý ảnh đã được crop
                  }
                },
              );
            },
          ),
        ),
      ),
      scrollable: false,
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      isCustomSizeWithKeyBoard: true,
    );
  }

  Future<XFile?> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      XFile? cropFile = await _cropImage(pickedFile);
      return cropFile;
    }
    return null;
  }

  _cropImage(XFile? pickedFile) {}

  void _bottomSheetChooseGender(
      BuildContext context, TextEditingController mGenderTextController) {
    CustomBottomSheet.showBottomSheet(
      context: context,
      title: 'Gender',
      child: Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Text(
                    textAlign: TextAlign.center,
                    index == 0 ? "Female" : "Male",
                    style: context.appTextStyles.labelLarge
                        .copyWith(color: context.appColors.onSurface),
                  ).paddingBottomSpace(SpaceType.medium),
                  onTap: () => {
                    // Change state topic
                    if (index == 0)
                      {
                        mGenderTextController.text = "Female",
                      }
                    else
                      {
                        mGenderTextController.text = "Male",
                      },
                    context.pop()
                  },
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
}
