import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/presentation/category/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../assets/assets.gen.dart';
import '../../../core/router/router_path.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.appColors.surface,
          shadowColor: context.appColors.surface,
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: ClipOval(
              child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(
                  Assets.icBack.path,
                  color: context.appColors.onSurface,
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Category",
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          elevation: 4.0, // Độ cao của AppBar (shadow)
        ),
        body: const CategoryWidget());
  }
}
