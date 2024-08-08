import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../assets/assets.gen.dart';

class PromptCardWidget extends StatelessWidget {
  final String title;
  final String promptContent;
  final String category;
  const PromptCardWidget(
      {super.key,
      required this.title,
      required this.promptContent,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: context.appColors.brandPrimaryGradient,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: context.appTextStyles.titleMedium.bold
                          .copyWith(color: context.appColors.onPrimary),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'social | hospital',
                      style: context.appTextStyles.labelSmall
                          .copyWith(color: context.appColors.onPrimary),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: ClipOval(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      Assets.icMenuVertical.path,
                      color: context.appColors.onPrimary,
                    ),
                  ),
                ),
              ),
            ],

          ),
          Text(
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            promptContent,
            style: context.appTextStyles.labelMedium
                .copyWith(color: context.appColors.onPrimary),
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
