import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/auth/auth_notifier.dart';
import 'package:brain_box_ai/providers/auth/state/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';

abstract class LoginCallBack {
  onLogin(BuildContext context, AuthNotifier authNotifier, String email,
      String password);
  onGoogleLogin(BuildContext context);
  onFaceBookLogin(BuildContext context);

  goBack(BuildContext context);
  goToForgetPassword(BuildContext context);
  goToSignUp(BuildContext context);
}

class LoginInContentWidget extends HookConsumerWidget implements LoginCallBack {
  final GlobalKey<FormState> _mFormKey = GlobalKey<FormState>();

  LoginInContentWidget({super.key});

  @override
  goBack(BuildContext context) {
    // TODO: implement goBack
    context.pop();
  }

  @override
  goToForgetPassword(BuildContext context) {
    // TODO: implement goToForgetPassword
    context.push(RouterPath.resetPass.getPath);
  }

  @override
  goToSignUp(BuildContext context) {
    // TODO: implement goToSignUp
    context.pushReplacement(RouterPath.signUpPage.getPath);
  }

  @override
  onFaceBookLogin(BuildContext context) {
    // TODO: implement onFaceBookLogin
    throw UnimplementedError();
  }

  @override
  onGoogleLogin(BuildContext context) {
    // TODO: implement onGoogleLogin
    throw UnimplementedError();
  }

  @override
  onLogin(BuildContext context, AuthNotifier authNotifier, String email,
      String password) {
    // TODO: implement onLogin
    authNotifier.login(email, password);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final authNotifier = ref.read(authNotifierProvider.notifier);

    final emailTextFieldController = useTextEditingController();
    final passwordTextFieldController = useTextEditingController();
    final obscureText = useState(true);

    ref.listen<AuthState>(authNotifierProvider, (previousState, currentState) {
      if (currentState is Authenticated) {
        context.push(RouterPath.homePage.getPath);
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
            _buildFormLogin(context, emailTextFieldController,
                passwordTextFieldController, obscureText, _mFormKey),
            _buildForgetButton(context),
            _buildStateLoading(context, authState),
            _buildLoginButton(context, authNotifier, emailTextFieldController,
                passwordTextFieldController),
            _buildSignUpTextButton(context),
            Divider(
              color: context.appColors.outline,
            ).paddingVerticalSpace(SpaceType.medium),
            _buildSocialButtons(context),
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
      "Login Your \nAccount",
      style: context.appTextStyles.displaySmall.bold
          .copyWith(color: context.appColors.onSurface),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.extraLarge);
  }

  Widget _buildFormLogin(
      BuildContext context,
      TextEditingController emailTextFieldController,
      TextEditingController passwordTextFieldController,
      ValueNotifier<bool> obscureText,
      GlobalKey<FormState> mFormKey) {
    return Form(
        key: mFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailTextFieldController,
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.onSurface),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Assets.icEmail.image(
                      width: 24,
                      height: 24,
                      color: context.appColors.onSurface.withOpacity(0.6)),
                ),
                filled: true, // Bật màu nền
                fillColor: context.appColors.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                hintText: "Enter Your Email",
                hintStyle: context.appTextStyles.labelLarge.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
            TextFormField(
              controller: passwordTextFieldController,
              style: context.appTextStyles.labelLarge
                  .copyWith(color: context.appColors.onSurface),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Assets.icLock.image(
                      width: 24,
                      height: 24,
                      color: context.appColors.onSurface.withOpacity(0.6)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                filled: true,
                fillColor: context.appColors.surfaceContainerHighest,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                hintText: "Password",
                hintStyle: context.appTextStyles.labelLarge.copyWith(
                    color: context.appColors.onSurface.withOpacity(0.6)),
                labelStyle: context.appTextStyles.labelLarge
                    .copyWith(color: context.appColors.onSurface),
                suffixIcon: _obscureTextIcon(context, obscureText),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
          ],
        ));
  }

  Widget _obscureTextIcon(
      BuildContext context, ValueNotifier<bool> isShowPassword) {
    return IconButton(
      icon: Icon(isShowPassword.value ? Icons.visibility_off : Icons.visibility,
          color: context.appColors.onSurface.withOpacity(0.6)),
      onPressed: () {
        isShowPassword.value = !isShowPassword.value;
      },
    );
  }

  Widget _buildForgetButton(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
            onPressed: () {
              goToForgetPassword(context);
            },
            child: Text(
              "Forget Password ?",
              style: context.appTextStyles.titleSmall.copyWith(
                  color: context.appColors.onSurface.withOpacity(0.6)),
            ))
      ],
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildStateLoading(BuildContext context, AuthState authState) {
    return authState is AuthLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(context.appColors.primary),
            ).paddingBottomSpace(SpaceType.medium),
          )
        : authState is AuthError
            ? Text(
                authState.toString(),
                style: context.appTextStyles.titleSmall
                    .copyWith(color: context.appColors.error),
              )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium)
            : const SizedBox();
  }

  Widget _buildLoginButton(
      BuildContext context,
      AuthNotifier authNotifier,
      TextEditingController emailTextFieldController,
      TextEditingController passwordTextFieldController) {
    return ElevatedButton(
      onPressed: () {
        if (_mFormKey.currentState!.validate()) {
          onLogin(context, authNotifier, emailTextFieldController.text,
              passwordTextFieldController.text);
        }
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
        "Login",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onSurface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildSignUpTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Create New Account?",
            style: context.appTextStyles.titleSmall.copyWith(
              color: context.appColors.onSurface.withOpacity(0.6),
            ),
            children: [
              TextSpan(
                text: " Sign up",
                style: context.appTextStyles.titleSmall.bold
                    .copyWith(color: context.appColors.onSurface),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Action khi nhấn vào "Sign up"
                    goToSignUp(context);
                  },
              ),
            ],
          ),
        ),
      ],
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Continue With Accounts",
              style: context.appTextStyles.titleSmall.copyWith(
                  color: context.appColors.onSurface.withOpacity(0.6)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onGoogleLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.minPositive, 60),
                  backgroundColor: HexColor.formHex('#DB4437'),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: HexColor.formHex('#DB4437'), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Google",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.onSurface),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  onGoogleLogin(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.minPositive, 60),
                  backgroundColor: HexColor.formHex('#1877F2'),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: HexColor.formHex('#1877F2'), width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "FaceBook",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.onSurface),
                ),
              ),
            ),
          ],
        )
            .paddingHorizontalSpace(SpaceType.medium)
            .paddingTopSpace(SpaceType.large)
      ],
    );
  }
}
