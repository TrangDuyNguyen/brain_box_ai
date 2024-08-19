import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/presentation/auth/widgets/auth_content_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.surface,
      body: const SafeArea(
        child: Padding(padding: EdgeInsets.all(20), child: AuthContentWidget()),
      ),
    );
  }
}
