import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';

class AuthContentWidget extends StatelessWidget {
  const AuthContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Expanded(
          flex: 3,
          child: Assets.auth.icAuthLogo.image(),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              " Welcome to \nBrainBox",
              style: context.appTextStyles.titleLarge.bold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            context.push(RouterPath.loginPage.getPath);
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
            context.push(RouterPath.signUpPage.getPath);
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
        const Spacer(),
        Text(
          "Continue With Accounts",
          style: context.appTextStyles.titleMedium
              .copyWith(color: context.appColors.outlineVariant),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 23,
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
      ],
    );
  }
}
