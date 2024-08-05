import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/core/utility/space_utils.dart';
import 'package:brain_box_ai/providers/auth/register_notifier.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../providers/auth/sign_up_form_notifier.dart';
import '../../../providers/auth/state/register_state.dart';

abstract class SignUpCallBack {
  onRegister(BuildContext context);
  onGoogleLogin(BuildContext context);
  onFaceBookLogin(BuildContext context);

  goBack(BuildContext context);
  goToLogin(BuildContext context);
}

class SignUpContentWidget extends HookConsumerWidget implements SignUpCallBack {
  final GlobalKey<FormState> _mFormKey = GlobalKey<FormState>();

  SignUpContentWidget({super.key});

  @override
  goBack(BuildContext context) {
    // TODO: implement goBack
    context.pop();
  }

  @override
  goToLogin(BuildContext context) {
    // TODO: implement goToLogin
    context.pushReplacement(RouterPath.loginPage.getPath);
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
  onRegister(BuildContext context) {
    // TODO: implement onRegister
    context.push(RouterPath.phoneNumber.getPath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerNotifierProvider);
    final registerNotifier = ref.read(registerNotifierProvider.notifier);

    final signUpFormState = ref.watch(signUpFormProvider);
    final signUpFormNotifier = ref.read(signUpFormProvider.notifier);

    final fullNameTextFieldController =
        useTextEditingController(text: signUpFormState.fullName);
    final emailTextFieldController =
        useTextEditingController(text: signUpFormState.email);
    final passwordTextFieldController =
        useTextEditingController(text: signUpFormState.password);
    final obscureText = useState(true);

    ref.listen<RegisterState>(registerNotifierProvider,
        (previousState, currentState) {
      if (currentState is RegisterSuccess) {
        onRegister(context);
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
            _buildForm(
                context,
                fullNameTextFieldController,
                emailTextFieldController,
                passwordTextFieldController,
                obscureText,
                signUpFormNotifier),
            _buildStateLoading(context, registerState),
            _buildRegisterButton(
                context,
                registerNotifier,
                registerState,
                fullNameTextFieldController,
                emailTextFieldController,
                passwordTextFieldController),
            _buildLoginTextButton(context),
            _buildDivider(),
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
      "Create your \nAccount",
      style: context.appTextStyles.displaySmall.bold,
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.extraLarge);
  }

  Widget _buildForm(
      BuildContext context,
      TextEditingController fullNameTextFieldController,
      TextEditingController usernameTextFieldController,
      TextEditingController passwordTextFieldController,
      ValueNotifier<bool> obscureText,
      SignUpFormNotifier signUpFormNotifier) {
    return Form(
      key: _mFormKey,
      child: Column(
        children: [
          _buildFullNameTextField(
              context, fullNameTextFieldController, signUpFormNotifier),
          _buildEmailTextField(
              context, usernameTextFieldController, signUpFormNotifier),
          _buildPasswordTextField(context, passwordTextFieldController,
              obscureText, signUpFormNotifier),
        ],
      ),
    );
  }

  Widget _buildFullNameTextField(BuildContext context,
      TextEditingController controller, SignUpFormNotifier signUpFormNotifier) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 60,
      child: TextFormField(
        controller: controller,
        onChanged: (value) => signUpFormNotifier.updateFullName(value),
        decoration: InputDecoration(
          icon: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Assets.icUser.image(),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: "Full Name",
          hintStyle: TextStyle(
            color: context.appColors.secondary.withOpacity(0.4),
            fontSize: 14,
          ),
        ),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildEmailTextField(BuildContext context,
      TextEditingController controller, SignUpFormNotifier signUpFormNotifier) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 60,
      child: TextFormField(
        controller: controller,
        onChanged: (value) => signUpFormNotifier.updateEmail(value),
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
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildPasswordTextField(
      BuildContext context,
      TextEditingController controller,
      ValueNotifier<bool> obscureText,
      SignUpFormNotifier signUpFormNotifier) {
    return Container(
      decoration: BoxDecoration(
        color: context.appColors.onPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 60,
      child: TextFormField(
        controller: controller,
        onChanged: (value) => signUpFormNotifier.updatePassword(value),
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
          suffixIcon: _obscureTextIcon(context, obscureText),
        ),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.large);
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

  Widget _buildStateLoading(BuildContext context, RegisterState registerState) {
    return registerState is RegisterLoading
        ? Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(context.appColors.primary),
            ).paddingBottomSpace(SpaceType.medium),
          )
        : registerState is RegisterError
            ? Text(
                registerState.toString(),
                style: context.appTextStyles.titleSmall
                    .copyWith(color: context.appColors.error),
              )
                .paddingHorizontalSpace(SpaceType.medium)
                .paddingBottomSpace(SpaceType.medium)
            : const SizedBox();
  }

  Widget _buildRegisterButton(
      BuildContext context,
      RegisterNotifier registerNotifier,
      RegisterState registerState,
      TextEditingController fullNameTextFieldController,
      TextEditingController emailTextFieldController,
      TextEditingController passwordTextFieldController) {
    return MaterialButton(
      onPressed: () {
        if (_mFormKey.currentState!.validate()) {
          registerNotifier.register(
              emailTextFieldController.text,
              fullNameTextFieldController.text,
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
        "Register",
        style: context.appTextStyles.titleMedium.bold
            .copyWith(color: context.appColors.surface),
      ),
    )
        .paddingHorizontalSpace(SpaceType.medium)
        .paddingBottomSpace(SpaceType.medium);
  }

  Widget _buildLoginTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: "Already Have An Account?",
            style: context.appTextStyles.titleSmall.copyWith(
              color: context.appColors.secondary.withOpacity(0.4),
            ),
            children: [
              TextSpan(
                text: " Login",
                style: context.appTextStyles.titleSmall.bold,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Action khi nhấn vào "Sign up"
                    goToLogin(context);
                  },
              ),
            ],
          ),
        ),
      ],
    ).paddingTopSpace(SpaceType.medium);
  }

  Widget _buildDivider() {
    return const Divider().paddingVerticalSpace(SpaceType.medium);
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
            ),
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
            .paddingTopSpace(SpaceType.medium),
      ],
    );
  }
}
