import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/router/router_path.dart';
import '../widgets/on_boarding_content_widget.dart';

class OnBoardingPage extends HookConsumerWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        context.push(RouterPath.authPage.getPath);
                      },
                      child: Text("Skip",
                          style: context.appTextStyles.titleMedium.bold
                              .copyWith(
                                  color: context.appColors.outline
                                      .withOpacity(0.6))),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(flex: 7, child: OnBoardingContentWidget())
          ],
        ),
      ),
    );
  }
}
