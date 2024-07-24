import 'package:flutter/material.dart';

import '../../../assets/assets.gen.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Assets.onBoarding.onBoarding1.image(),
      ),
    );
  }
}
