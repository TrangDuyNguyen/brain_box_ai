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

    return Scaffold(
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
            const Divider().paddingVerticalSpace(SpaceType.medium),
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
      "Login Your \nAccount",
      style: context.appTextStyles.displaySmall.bold,
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
            Container(
              decoration: BoxDecoration(
                color: context.appColors.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              child: TextFormField(
                controller: emailTextFieldController,
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Assets.icEmail.image(),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(
                    color: context.appColors.secondary.withOpacity(0.4),
                    fontSize: 14,
                  ),
                ),
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
                controller: passwordTextFieldController,
                obscureText: obscureText.value,
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
                    suffixIcon: _obscureTextIcon(context, obscureText)),
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
          color: context.appColors.secondary.withOpacity(0.4)),
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
                  color: context.appColors.secondary.withOpacity(0.4)),
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
    return MaterialButton(
      onPressed: () {
        if (_mFormKey.currentState!.validate()) {
          onLogin(context, authNotifier, emailTextFieldController.text,
              passwordTextFieldController.text);
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
        "Login",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.surface),
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
              color: context.appColors.secondary.withOpacity(0.4),
            ),
            children: [
              TextSpan(
                text: " Sign up",
                style: context.appTextStyles.titleSmall.bold,
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
                  color: context.appColors.secondary.withOpacity(0.4)),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                elevation: 0,
                color: context.appColors.errorContainer,
                height: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Google",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.error),
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                elevation: 0,
                color: context.appColors.inversePrimary,
                height: 60,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Facebook",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.surfaceTint),
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
