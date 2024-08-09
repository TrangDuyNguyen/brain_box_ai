import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/prompt_management_content_widget.dart';

class PromptManagementPage extends HookConsumerWidget {
  const PromptManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PromptManagementContentWidget();
  }
}
