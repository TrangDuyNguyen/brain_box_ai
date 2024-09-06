import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:flutter/material.dart';

import '../widgets/filter_widget.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Filter Prompt",
            style: context.appTextStyles.titleMedium,
          ),
        ),
        body: const FilterWidget());
  }
}
