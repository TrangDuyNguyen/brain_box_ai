import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/presentation/search/widgets/search_prompt_widget.dart';
import 'package:flutter/material.dart';

class SearchPromptPage extends StatelessWidget {
  const SearchPromptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Search Prompt",
            style: context.appTextStyles.titleMedium,
          ),
        ),
        body: const SearchPromptWidget());
  }
}
