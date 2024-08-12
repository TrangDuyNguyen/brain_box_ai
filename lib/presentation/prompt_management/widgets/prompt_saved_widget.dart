import 'package:flutter/material.dart';

import '../../widgets/prompt_card_widget.dart';

class PromptSavedWidget extends StatelessWidget {
  const PromptSavedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: 5,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: const PromptCardWidget(
            title: 'Melos overview',
            promptContent:
                'Freezed là một gói giúp bạn tạo ra các lớp dữ liệu bất biến và các kiểu dữ liệu phân biệt (union/sealed classes) trong Dart.',
            category: '',
          ),
        );
      },
    );
  }
}
