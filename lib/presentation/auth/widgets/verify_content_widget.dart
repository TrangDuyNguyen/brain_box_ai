import 'dart:async';

import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../assets/assets.gen.dart';

class VerifyContentWidget extends HookConsumerWidget {
  const VerifyContentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = TextEditingController();
    const duration = Duration(minutes: 1);
    final remainingTime = useState(duration);

    Timer? timer;

    void startTimer() {
      timer?.cancel();
      timer = Timer.periodic(const Duration(seconds: 1), (t) {
        if (remainingTime.value > const Duration(seconds: 0)) {
          remainingTime.value -= const Duration(seconds: 1);
        } else {
          t.cancel();
        }
      });
    }

    useEffect(() {
      startTimer();
      return () => timer?.cancel();
    }, []);

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
              "Verify Phone \nNumber",
              style: context.appTextStyles.displaySmall.bold,
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.small),
            Text(
              "We Have Sent Code To Your Phone Number",
              style: context.appTextStyles.titleMedium
                  .copyWith(color: context.appColors.outlineVariant),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.extraLarge),
            PinCodeTextField(
              appContext: context,
              length: 4,
              pastedTextStyle: context.appTextStyles.labelMedium.bold,
              animationType: AnimationType.fade,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(13),
                borderWidth: 2,
                fieldHeight: 60,
                fieldWidth: 60,
                inactiveColor: context.appColors.outline,
                inactiveFillColor: context.appColors.surface,
                activeColor: context.appColors.outline,
                activeFillColor: context.appColors.surface,
                selectedColor: context.appColors.outline,
                selectedFillColor: context.appColors.surface,
                errorBorderColor: context.appColors.error,
              ),
              cursorColor: context.appColors.outline,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: pinController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                debugPrint("Completed");
              },
              onTap: () {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                if (text!.contains(RegExp(r'^\d+$'))) {
                  // Chỉ cho phép dán nếu văn bản chỉ chứa số
                  return true;
                }
                return false;
              },
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.small),
            Visibility(
              visible: remainingTime.value > const Duration(seconds: 0),
              child: Text(
                formatDuration(remainingTime.value),
                style: context.appTextStyles.labelMedium,
              )
                  .paddingHorizontalSpace(SpaceType.medium)
                  .paddingBottomSpace(SpaceType.medium),
            ),
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
                "Verification",
                style: context.appTextStyles.titleMedium.bold
                    .copyWith(color: context.appColors.surface),
              ),
            )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium),
            MaterialButton(
              onPressed: remainingTime.value != const Duration(seconds: 0)
                  ? null
                  : () {
                      remainingTime.value = duration;
                      startTimer();
                    },
              minWidth: double.maxFinite,
              elevation: 0,
              color: context.appColors.outlineVariant,
              height: 60,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: context.appColors.outlineVariant, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Send again",
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

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "($twoDigitMinutes:$twoDigitSeconds)";
  }
}
