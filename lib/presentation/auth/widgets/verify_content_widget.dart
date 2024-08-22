import 'dart:async';

import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/auth/state/verify_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';
import '../../../providers/auth/verify_notifier.dart';

abstract class VerifyCallBack {
  onVerify(BuildContext context);
  onResend(BuildContext context);

  goBack(BuildContext context);
}

class VerifyContentWidget extends HookConsumerWidget implements VerifyCallBack {
  const VerifyContentWidget({super.key});

  @override
  goBack(BuildContext context) {
    // TODO: implement goBack
    context.pop();
  }

  @override
  onResend(context) {
    // TODO: implement onResend
    throw UnimplementedError();
  }

  @override
  onVerify(context) {
    // TODO: implement onVerify
    context.push(RouterPath.homePage.getPath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final verifyState = ref.watch(verifyNotifierProvider);
    final verifyNotifier = ref.read(verifyNotifierProvider.notifier);

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

    ref.listen<VerifyState>(verifyNotifierProvider,
        (previousState, currentState) {
      if (currentState is Verified) {
        onVerify(context);
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
            _buildSubtitle(context),
            _buildPinCodeField(context, pinController),
            _buildRemainingTime(context, remainingTime),
            _buildStateLoading(context, verifyState),
            _buildVerifyButton(context, verifyNotifier, pinController),
            _buildResendButton(context, remainingTime, duration, startTimer),
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
      "Verify Phone \nNumber",
      style: context.appTextStyles.displaySmall.bold
          .copyWith(color: context.appColors.onSurface),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.small);
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      "We Have Sent Code To Your Phone Number",
      style: context.appTextStyles.titleMedium
          .copyWith(color: context.appColors.onSurface.withOpacity(0.6)),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.extraLarge);
  }

  Widget _buildPinCodeField(
      BuildContext context, TextEditingController pinController) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      pastedTextStyle: context.appTextStyles.labelMedium.bold
          .copyWith(color: context.appColors.onSurface),
      animationType: AnimationType.fade,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        borderWidth: 2,
        fieldHeight: 60,
        fieldWidth: 60,
        inactiveColor: context.appColors.outline,
        inactiveFillColor: context.appColors.surfaceContainerHighest,
        activeColor: context.appColors.outline,
        activeFillColor: context.appColors.surface,
        selectedColor: context.appColors.outline,
        selectedFillColor: context.appColors.surface,
        errorBorderColor: context.appColors.error,
      ),
      cursorColor: context.appColors.outline,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      textStyle: context.appTextStyles.titleMedium
          .copyWith(color: context.appColors.onSurface),
      controller: pinController,
      keyboardType: TextInputType.number,
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onTap: () {},
      onChanged: (value) {},
      beforeTextPaste: (text) {
        if (text!.contains(RegExp(r'^\d+$'))) {
          return true;
        }
        return false;
      },
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.small);
  }

  Widget _buildRemainingTime(
      BuildContext context, ValueNotifier<Duration> remainingTime) {
    return Visibility(
      visible: remainingTime.value > const Duration(seconds: 0),
      child: Text(formatDuration(remainingTime.value),
              style: context.appTextStyles.labelMedium.copyWith(
                  color: context.appColors.onSurface.withOpacity(0.6)))
          .paddingHorizontalSpace(SpaceType.medium)
          .paddingBottomSpace(SpaceType.medium),
    );
  }

  _buildStateLoading(
    BuildContext context,
    VerifyState verifyState,
  ) {
    return verifyState is VerifyLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(context.appColors.primary),
            ).paddingBottomSpace(SpaceType.medium),
          )
        : verifyState is VerifyError
            ? Text(
                verifyState.toString(),
                style: context.appTextStyles.titleSmall
                    .copyWith(color: context.appColors.error),
              )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium)
            : const SizedBox();
  }

  Widget _buildVerifyButton(BuildContext context, VerifyNotifier verifyNotifier,
      TextEditingController pinController) {
    return ElevatedButton(
      onPressed: () {
        verifyNotifier.verifyAcc(pinController.text);
      },
      style: ElevatedButton.styleFrom(
        minimumSize:
            const Size(double.infinity, 60), // Chiều rộng max và chiều cao 60
        backgroundColor: context.appColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.primary, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Verification",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onSurface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildResendButton(
      BuildContext context,
      ValueNotifier<Duration> remainingTime,
      Duration duration,
      void Function() startTimer) {
    return ElevatedButton(
      onPressed: remainingTime.value != const Duration(seconds: 0)
          ? null
          : () {
              remainingTime.value = duration;
              startTimer();
            },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: context.appColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.appColors.outline, width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        "Send again",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.onSurface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "($twoDigitMinutes:$twoDigitSeconds)";
  }
}
