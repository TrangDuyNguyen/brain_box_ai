import 'package:brain_box_ai/core/theme/app_color.dart';
import 'package:brain_box_ai/core/theme/app_text_style.dart';
import 'package:brain_box_ai/presentation/profile/profile_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../assets/assets.gen.dart';

abstract class ProfileDetailPageCallBack {
  void goBack(BuildContext context);
}

class ProfileDetailPage extends StatelessWidget
    implements ProfileDetailPageCallBack {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            goBack(context);
          },
          child: Image.asset(
            Assets.icBack.path,
            width: 24,
            height: 24,
            color: context.appColors.onSurface,
          ),
        ),
        title: Text(
          "Profile",
          style: context.appTextStyles.titleMedium.bold
              .copyWith(color: context.appColors.onSurface),
        ),
      ),
      body: ProfileDetailWidget(),
    );
  }

  @override
  void goBack(BuildContext context) {
    context.pop();
  }
}
