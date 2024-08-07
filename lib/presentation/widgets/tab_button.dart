import 'package:brain_box_ai/core/theme/app_color.dart';
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
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              child: Image.asset(
                fit: BoxFit.fill,
                icon,
                width: 30,
                height: 30,
                color: isSelect
                    ? context.appColors.primary
                    : context.appColors.secondary,
              ),
            ),
          ],
        ));
  }
}
