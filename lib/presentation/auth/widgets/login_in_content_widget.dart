import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';

class LoginInContentWidget extends HookConsumerWidget {
  const LoginInContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameTextFieldController = TextEditingController();
    final passwordTextFieldController = TextEditingController();
    final obscureText = useState(true);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                .paddingHorizontalSpace(SpaceType.medium),
            Text(
              "Login Your \nAccount",
              style: context.appTextStyles.displaySmall.bold,
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.extraLarge),
            Container(
              decoration: BoxDecoration(
                color: context.appColors.onPrimary,
                borderRadius: BorderRadius.circular(12),
              ),
              height: 60,
              child: TextFormField(
                controller: usernameTextFieldController,
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
            Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password ?",
                      style: context.appTextStyles.titleSmall.copyWith(
                          color: context.appColors.secondary.withOpacity(0.4)),
                    ))
              ],
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
            MaterialButton(
              onPressed: () {},
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
                .paddingBottomSpace(SpaceType.medium),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Create New Account?",
                      style: context.appTextStyles.titleSmall.copyWith(
                          color: context.appColors.secondary.withOpacity(0.4)),
                      children: [
                        TextSpan(
                          text: " Sign up",
                          style: context.appTextStyles.titleSmall.bold,
                        )
                      ]),
                )
              ],
            ).paddingTopSpace(SpaceType.medium),
            const Divider().paddingVerticalSpace(SpaceType.medium),
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
                .paddingTopSpace(SpaceType.medium)
          ],
        ),
      ),
    );
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
}
