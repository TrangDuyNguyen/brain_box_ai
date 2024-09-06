import 'package:brain_box_ai/core/router/router_path.dart';
import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../assets/assets.gen.dart';
import '../../../domain/entities/search/search_result_param.dart';
import '../widgets/search_result_widget.dart';

class SearchResultPage extends HookConsumerWidget {
  final SearchResultParam searchResultParam;
  const SearchResultPage(this.searchResultParam, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            "Search Results",
            style: context.appTextStyles.titleMedium.bold
                .copyWith(color: context.appColors.onSurface),
          ),
          actions: [
            InkWell(
              onTap: () {
                context.push(RouterPath.filter.getPath);
              },
              child: ClipOval(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset(
                    Assets.icFilter.path,
                    color: context.appColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          elevation: 4.0, // Độ cao của AppBar (shadow)
        ),
        body: SearchResultWidget(searchResultParam));
  }
}
