import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/utility/app_context.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final bool isSelect;
  final VoidCallback onPressed;

  const TabButton(
      {super.key,
      required this.icon,
      required this.isSelect,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                decoration: BoxDecoration(
                    color: isSelect
                        ? context.appColors.secondaryContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(16)),
                alignment: Alignment.center,
                child: Image.asset(
                  fit: BoxFit.fill,
                  icon,
                  width: 24,
                  height: 24,
                  color: isSelect
                      ? context.appColors.primary
                      : context.appColors.onPrimary,
                ),
              ),
            ),
          ],
        ));
  }
}
