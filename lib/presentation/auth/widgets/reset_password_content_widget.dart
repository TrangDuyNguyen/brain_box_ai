import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/auth/state/reset_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
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
    throw UnimplementedError();
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
              color: context.appColors.outlineVariant.withOpacity(0.5),
              blurRadius: 10,
            )
          ]),
          child: ElevatedButton(
            onPressed: () {
              goBack(context);
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
      "Rest Your \nPassword",
      style: context.appTextStyles.displaySmall.bold,
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
                color: context.appColors.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              child: TextFormField(
                controller: passwordTextFieldController,
                obscureText: obscurePass.value,
                decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Assets.icLock.image(),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: context.appColors.secondary.withOpacity(0.4),
                      fontSize: 14,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          obscurePass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: context.appColors.secondary.withOpacity(0.4)),
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
                color: context.appColors.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              child: TextFormField(
                controller: rePasswordTextFieldController,
                obscureText: obscureRePass.value,
                decoration: InputDecoration(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Assets.icLock.image(),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: "Re password",
                    hintStyle: TextStyle(
                      color: context.appColors.secondary.withOpacity(0.4),
                      fontSize: 14,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          obscureRePass.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: context.appColors.secondary.withOpacity(0.4)),
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
    return MaterialButton(
      onPressed: () {
        if (_mFormKey.currentState!.validate()) {
          resetNotifier.resetPassword(rePasswordTextFieldController.text);
        }
      },
      minWidth: double.maxFinite,
      elevation: 0,
      color: context.appColors.onSurface,
      height: 60,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.tertiary, width: 1),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        "Reset",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.surface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }
}
