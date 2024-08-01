import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../assets/assets.gen.dart';

class PhoneNumberContentWidget extends HookConsumerWidget {
  const PhoneNumberContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumberTextFieldController = TextEditingController();

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
              "Enter Your Email",
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
                controller: phoneNumberTextFieldController,
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
            ).paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.large),
            MaterialButton(
              onPressed: () {
                context.push(RouterPath.verifyAcc.getPath);
              },
              minWidth: double.maxFinite,
              elevation: 0,
              color: context.appColors.onSurface,
              height: 60,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: context.appColors.tertiary, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Verification",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.surface),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
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
                "Register",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.outline),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
          ],
        ),
      ),
    );
  }
}
