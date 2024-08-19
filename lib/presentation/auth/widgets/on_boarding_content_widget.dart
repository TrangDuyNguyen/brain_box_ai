import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';

class OnBoardingContentWidget extends HookConsumerWidget {
  const OnBoardingContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    final currentPage = useState(0);

    List<Map<String, String>> onboardingData = [
      {
        "title": "Unlock the Power \nOf Future AI",
        "subtitle":
            "Chat with the smartest AI Future\nExperience power of AI with us",
        "image": Assets.onBoarding.onBoarding1.path,
      },
      {
        "title": "Chat With Your \nFavourite Ai",
        "subtitle":
            "Chat with the smartest AI Future\nExperience power of AI with us",
        "image": Assets.onBoarding.onBoarding2.path,
      },
      {
        "title": "Boost Your Mind \nPower with Ai",
        "subtitle":
            "Chat with the smartest AI Future\nExperience power of AI with us",
        "image": Assets.onBoarding.onBoarding3.path,
      },
      // Add more onboarding pages here if needed
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: PageView.builder(
            controller: pageController,
            itemCount: onboardingData.length,
            onPageChanged: (value) {
              currentPage.value = value;
            },
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                onboardingData[index]["image"]!,
              ),
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: currentPage.value == index ? 24.0 : 8.0,
                      width: currentPage.value == index ? 24.0 : 8.0,
                      child: currentPage.value == index
                          ? Assets.onBoarding.icDotSlide
                              .image(color: context.appColors.onSurface)
                          : Assets.onBoarding.icDot
                              .image(color: context.appColors.onSurface),
                    );
                  }),
                ),
                const Spacer(),
                Text(
                  onboardingData[currentPage.value]["title"]!,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.titleLarge.bold
                      .copyWith(color: context.appColors.onSurface),
                ),
                const SizedBox(height: 16),
                Text(
                  onboardingData[currentPage.value]["subtitle"]!,
                  textAlign: TextAlign.center,
                  style: context.appTextStyles.labelMedium.copyWith(
                      color: context.appColors.onSurface.withOpacity(0.6)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Container(
                      width: 154,
                      height: 64,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: context.appColors.outline,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ]),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: context.appColors.surface,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () => pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    ),
                                child: Assets.onBoarding.icArrowPre.image()),
                            Container(
                              width: 1,
                              height: 30,
                              color: context.appColors.outline.withOpacity(0.6),
                            ),
                            GestureDetector(
                                onTap: () => pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease,
                                    ),
                                child: Assets.onBoarding.icArrowNext.image()),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ))
      ],
    );
  }
}
