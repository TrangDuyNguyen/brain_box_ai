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
  goBack(BuildContext context);
  onSendEmailVerify(BuildContext context);
  onLater(BuildContext context);
}

class SendEmailContentWidget extends HookConsumerWidget
    implements SendEmailCallback {
  const SendEmailContentWidget({super.key});

  @override
  goBack(BuildContext context) {
    // TODO: implement goBack
    context.pop();
  }

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
      backgroundColor: context.appColors.surface,
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
              color: context.appColors.outline.withOpacity(0.5),
              blurRadius: 10,
            )
          ]),
          child: ElevatedButton(
            onPressed: () {
              goBack(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.appColors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16),
            ),
            child: Assets.icBack.image(color: context.appColors.onSurface),
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
      style: context.appTextStyles.displaySmall.bold
          .copyWith(color: context.appColors.onSurface),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.extraLarge);
  }

  Widget _buildEmailTextField(BuildContext context,
      TextEditingController phoneNumberTextFieldController) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 56,
      child: TextFormField(
        controller: phoneNumberTextFieldController,
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
            child: Assets.icEmail.image(
                width: 24,
                height: 24,
                color: context.appColors.onSurface.withOpacity(0.6)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(4),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          hintText: "Enter Your Email",
          hintStyle: context.appTextStyles.labelMedium
              .copyWith(color: context.appColors.onSurface.withOpacity(0.6)),
          labelStyle: context.appTextStyles.labelMedium
              .copyWith(color: context.appColors.onSurface),
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
    return ElevatedButton(
      onPressed: () {
        sendVerifyNotifier.sendVerify(phoneNumberTextFieldController.text);
      },
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
        "Send Verify",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onPrimary),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildButtonLater(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: context.appColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.outline, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Later",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onSurface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }
}
