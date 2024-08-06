import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/auth/state/send_verify_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../providers/auth/send_verify_notifier.dart';

abstract class SendEmailCallback {
  onSendEmailVerify(BuildContext context);
  onLater(BuildContext context);
}

class SendEmailContentWidget extends HookConsumerWidget
    implements SendEmailCallback {
  const SendEmailContentWidget({super.key});

  @override
  onLater(BuildContext context) {
    // TODO: implement onReSendVerify
    throw UnimplementedError();
  }

  @override
  onSendEmailVerify(BuildContext context) {
    // TODO: implement onSendEmailVerify
    context.push(RouterPath.verifyAcc.getPath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sendVerifyState = ref.watch(sendVerifyNotifierProvider);
    final sendVerifyNotifier = ref.read(sendVerifyNotifierProvider.notifier);

    final phoneNumberTextFieldController = TextEditingController();

    ref.listen<SendVerifyState>(sendVerifyNotifierProvider,
        (previousState, currentState) {
      if (currentState is SendVerified) {
        onSendEmailVerify(context);
      }
    });

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(context),
            _buildTitle(context),
            _buildEmailTextField(context, phoneNumberTextFieldController),
            _buildStateLoading(context, sendVerifyState),
            _buildButtonVerify(
                context, sendVerifyNotifier, phoneNumberTextFieldController),
            _buildButtonLater(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: context.appColors.outlineVariant.withOpacity(0.5),
              blurRadius: 10,
            )
          ]),
          child: ElevatedButton(
            onPressed: () {
              context.pop();
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: Assets.icBack.image(),
          ),
        ),
      ],
    )
        .paddingVerticalSpace(SpaceType.extraLarge)
        .paddingHorizontalSpace(SpaceType.medium);
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Enter Your Email",
      style: context.appTextStyles.displaySmall.bold,
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.extraLarge);
  }

  Widget _buildEmailTextField(BuildContext context,
      TextEditingController phoneNumberTextFieldController) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 60,
      child: TextFormField(
        controller: phoneNumberTextFieldController,
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Assets.icEmail.image(),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: "example@gmail.com",
          hintStyle: TextStyle(
            color: context.appColors.secondary.withOpacity(0.4),
            fontSize: 14,
          ),
        ),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.large);
  }

  _buildStateLoading(BuildContext context, SendVerifyState sendVerifyState) {
    return sendVerifyState is SendVerifyLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(context.appColors.primary),
            ).paddingBottomSpace(SpaceType.medium),
          )
        : sendVerifyState is SendVerifyError
            ? Text(
                sendVerifyState.toString(),
                style: context.appTextStyles.titleSmall
                    .copyWith(color: context.appColors.error),
              )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium)
            : const SizedBox();
  }

  Widget _buildButtonVerify(
      BuildContext context,
      SendVerifyNotifier sendVerifyNotifier,
      TextEditingController phoneNumberTextFieldController) {
    return MaterialButton(
      onPressed: () {
        sendVerifyNotifier.sendVerify(phoneNumberTextFieldController.text);
      },
      minWidth: double.maxFinite,
      elevation: 0,
      color: context.appColors.onSurface,
      height: 60,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.tertiary, width: 1),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        "Verification",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.surface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildButtonLater(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      minWidth: double.maxFinite,
      elevation: 0,
      color: context.appColors.outlineVariant,
      height: 60,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.outlineVariant, width: 1),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        "Later",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.outline),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }
}
