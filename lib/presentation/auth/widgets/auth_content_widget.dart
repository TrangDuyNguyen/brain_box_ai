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
          _buildLogo(context),
          _buildTitle(context),
          _buildAuthButtons(context),
          _buildContinueWithAccountsText(context),
          _buildSocialButtons(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Center(
            child: Assets.auth.icAuthLogo
                .image(color: context.appColors.primary))
        .paddingTopSpace(SpaceType.ultraLarge);
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      " Welcome to \nBrainBox",
      style: context.appTextStyles.displaySmall.bold
          .copyWith(color: context.appColors.onSurface),
      textAlign: TextAlign.center,
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildAuthButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            goToLogin(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
                double.infinity, 60), // Chiều rộng max và chiều cao 60
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
                .copyWith(color: context.appColors.onPrimary),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            goToSignUp(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(
                double.infinity, 60), // Chiều rộng max và chiều cao 60
            backgroundColor: context.appColors.surface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: context.appColors.outline, width: 1),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            "Sign In",
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
        ).paddingTopSpace(SpaceType.medium),
      ],
    ).paddingTopSpace(SpaceType.extraLarge);
  }

  Widget _buildContinueWithAccountsText(BuildContext context) {
    return Text(
      "Continue With Accounts",
      style: context.appTextStyles.titleSmall
          .copyWith(color: context.appColors.onSurface),
      textAlign: TextAlign.center,
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildSocialButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onGoogleLogin(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                  double.minPositive, 60),
              backgroundColor: HexColor.formHex('#DB4437'),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: HexColor.formHex('#DB4437'), width: 1),
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
              minimumSize: const Size(
                  double.minPositive, 60),
              backgroundColor: HexColor.formHex('#1877F2'),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: HexColor.formHex('#1877F2'), width: 1),
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
    ).paddingTopSpace(SpaceType.large);
  }
}
