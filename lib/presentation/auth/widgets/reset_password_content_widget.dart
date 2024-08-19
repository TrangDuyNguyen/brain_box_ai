import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/auth/state/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';
import '../../../providers/auth/reset_notifier.dart';

abstract class ResetPasswordCallBack {
  onReset(BuildContext context);
  goBack(BuildContext context);
}

class ResetPasswordContentWidget extends HookConsumerWidget
    implements ResetPasswordCallBack {
  final GlobalKey<FormState> _mFormKey = GlobalKey<FormState>();
  ResetPasswordContentWidget({super.key});

  @override
  goBack(BuildContext context) {
    // TODO: implement goBack
    context.pop();
  }

  @override
  onReset(BuildContext context) {
    // TODO: implement onReset
    context.pushReplacement(RouterPath.authPage.getPath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetState = ref.watch(resetNotifierProvider);
    final resetNotifier = ref.read(resetNotifierProvider.notifier);

    final passwordTextFieldController = useTextEditingController();
    final rePasswordTextFieldController = useTextEditingController();

    final obscurePass = useState(true);
    final obscureRePass = useState(true);

    ref.listen<ResetPasswordState>(resetNotifierProvider,
        (previousState, currentState) {
      if (currentState is ResetSuccess) {
        onReset(context);
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
            _buildForm(
                context,
                passwordTextFieldController,
                rePasswordTextFieldController,
                obscurePass,
                obscureRePass,
                _mFormKey),
            _buildStateLoading(context, resetState),
            _buildResetButton(context, resetNotifier,
                passwordTextFieldController, rePasswordTextFieldController),
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
      "Rest Your \nPassword",
      style: context.appTextStyles.displaySmall.bold
          .copyWith(color: context.appColors.onSurface),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.extraLarge);
  }

  Widget _buildForm(
      BuildContext context,
      TextEditingController passwordTextFieldController,
      TextEditingController rePasswordTextFieldController,
      ValueNotifier<bool> obscurePass,
      ValueNotifier<bool> obscureRePass,
      GlobalKey<FormState> mFormKey) {
    return Form(
        key: _mFormKey,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.appColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 56,
              child: TextFormField(
                controller: passwordTextFieldController,
                decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                      child: Assets.icLock.image(
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
                    hintText: "Password",
                    hintStyle: context.appTextStyles.labelMedium.copyWith(
                        color: context.appColors.onSurface.withOpacity(0.6)),
                    labelStyle: context.appTextStyles.labelMedium
                        .copyWith(color: context.appColors.onSurface),
                    suffixIcon: IconButton(
                      icon: Icon(
                          obscurePass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: context.appColors.onSurface.withOpacity(0.6)),
                      onPressed: () {
                        obscurePass.value = !obscurePass.value;
                      },
                    )),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
            Container(
              decoration: BoxDecoration(
                color: context.appColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(4),
              ),
              height: 56,
              child: TextFormField(
                controller: rePasswordTextFieldController,
                decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                      child: Assets.icLock.image(
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
                    hintText: "Re Password",
                    hintStyle: context.appTextStyles.labelMedium.copyWith(
                        color: context.appColors.onSurface.withOpacity(0.6)),
                    labelStyle: context.appTextStyles.labelMedium
                        .copyWith(color: context.appColors.onSurface),
                    suffixIcon: IconButton(
                      icon: Icon(
                          obscurePass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: context.appColors.onSurface.withOpacity(0.6)),
                      onPressed: () {
                        obscureRePass.value = !obscureRePass.value;
                      },
                    )),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
          ],
        ));
  }

  Widget _buildStateLoading(
      BuildContext context, ResetPasswordState resetState) {
    return resetState is ResetLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(context.appColors.primary),
            ).paddingBottomSpace(SpaceType.medium),
          )
        : resetState is ResetError
            ? Text(
                resetState.toString(),
                style: context.appTextStyles.titleSmall
                    .copyWith(color: context.appColors.error),
              )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium)
            : const SizedBox();
  }

  Widget _buildResetButton(
      BuildContext context,
      ResetNotifier resetNotifier,
      TextEditingController passwordTextFieldController,
      TextEditingController rePasswordTextFieldController) {
    return ElevatedButton(
      onPressed: () {
        if (_mFormKey.currentState!.validate()) {
          resetNotifier.resetPassword(rePasswordTextFieldController.text);
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(double.infinity, 60), // Chiều rộng max và chiều cao 60
        backgroundColor: context.appColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.primary, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Reset",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onPrimary),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingTopSpace(SpaceType.medium);
  }
}
