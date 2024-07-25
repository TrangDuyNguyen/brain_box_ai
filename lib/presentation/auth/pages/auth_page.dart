import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../assets/assets.gen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                onPressed: () {},
                minWidth: double.maxFinite,
                elevation: 0,
                color: context.appColors.onSurface,
                height: 60,
                shape: RoundedRectangleBorder(
                    side:
                        BorderSide(color: context.appColors.tertiary, width: 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Login",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.surface),
                ),
              ),
              const SizedBox(height: 23),
              MaterialButton(
                onPressed: () {},
                minWidth: double.maxFinite,
                elevation: 0,
                color: context.appColors.outlineVariant,
                height: 60,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: context.appColors.outlineVariant, width: 1),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Sign up",
                  style: context.appTextStyles.titleMedium.bold
                      .copyWith(color: context.appColors.surface),
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
                      color: context.appColors.error,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: context.appColors.error, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Google",
                        style: context.appTextStyles.titleMedium.bold
                            .copyWith(color: context.appColors.errorContainer),
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
                      color: context.appColors.surfaceTint,
                      height: 60,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: context.appColors.surfaceTint, width: 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Facebook",
                        style: context.appTextStyles.titleMedium.bold
                            .copyWith(color: context.appColors.inversePrimary),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
