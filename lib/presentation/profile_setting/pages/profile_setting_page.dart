import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_setting_content_widget.dart';

class ProfileSettingPage extends StatelessWidget {
  const ProfileSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        title: Text(
          "My Profile",
          style: context.appTextStyles.titleMedium.bold
              .copyWith(color: context.appColors.onSurface),
        ),
      ),
      body: const ProfileSettingContentWidget(),
    );
  }
}
