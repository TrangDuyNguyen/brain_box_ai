import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';

abstract class AuthContentCallBack {
  goToLogin(BuildContext context);
  goToSignUp(BuildContext context);
  onGoogleLogin(BuildContext context);
  onFaceBookLogin(BuildContext context);
}

class AuthContentWidget extends StatelessWidget implements AuthContentCallBack {
  const AuthContentWidget({super.key});

  @override
  goToLogin(BuildContext context) {
    // TODO: implement goToLogin
    context.push(RouterPath.loginPage.getPath);
  }

  @override
  goToSignUp(BuildContext context) {
    // TODO: implement goToSignUp
    context.push(RouterPath.signUpPage.getPath);
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLogo(),
          _buildTitle(context),
          _buildAuthButtons(context),
          _buildContinueWithAccountsText(context),
          _buildSocialButtons(context),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Center(child: Assets.auth.icAuthLogo.image())
        .paddingTopSpace(SpaceType.ultraLarge);
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      " Welcome to \nBrainBox",
      style: context.appTextStyles.displaySmall.bold,
      textAlign: TextAlign.center,
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildAuthButtons(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            goToLogin(context);
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
        ),
        const SizedBox(height: 23),
        MaterialButton(
          onPressed: () {
            goToSignUp(context);
          },
          minWidth: double.maxFinite,
          elevation: 0,
          color: context.appColors.outlineVariant,
          height: 60,
          shape: RoundedRectangleBorder(
              side:
                  BorderSide(color: context.appColors.outlineVariant, width: 1),
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            "Sign up",
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.outline),
          ),
        ),
      ],
    ).paddingTopSpace(SpaceType.extraLarge);
  }

  Widget _buildContinueWithAccountsText(BuildContext context) {
    return Text(
      "Continue With Accounts",
      style: context.appTextStyles.titleMedium
          .copyWith(color: context.appColors.outlineVariant),
      textAlign: TextAlign.center,
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              onGoogleLogin(context);
            },
            elevation: 0,
            color: context.appColors.errorContainer,
            height: 60,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Google",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.error),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: MaterialButton(
            onPressed: () {
              onFaceBookLogin(context);
            },
            elevation: 0,
            color: context.appColors.inversePrimary,
            height: 60,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Facebook",
              style: context.appTextStyles.titleMedium.bold
                  .copyWith(color: context.appColors.surfaceTint),
            ),
          ),
        ),
      ],
    ).paddingTopSpace(SpaceType.large);
  }
}
