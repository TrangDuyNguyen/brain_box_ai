/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAuthGen {
  const $AssetsAuthGen();

  /// File path: assets/auth/ic_auth_logo.png
  AssetGenImage get icAuthLogo =>
      const AssetGenImage('assets/auth/ic_auth_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [icAuthLogo];
}

class $AssetsOnBoardingGen {
  const $AssetsOnBoardingGen();

  /// File path: assets/on_boarding/ic_arrow_next.png
  AssetGenImage get icArrowNext =>
      const AssetGenImage('assets/on_boarding/ic_arrow_next.png');

  /// File path: assets/on_boarding/ic_arrow_pre.png
  AssetGenImage get icArrowPre =>
      const AssetGenImage('assets/on_boarding/ic_arrow_pre.png');

  /// File path: assets/on_boarding/ic_dot.png
  AssetGenImage get icDot =>
      const AssetGenImage('assets/on_boarding/ic_dot.png');

  /// File path: assets/on_boarding/ic_dot_slide.png
  AssetGenImage get icDotSlide =>
      const AssetGenImage('assets/on_boarding/ic_dot_slide.png');

  /// File path: assets/on_boarding/on_boarding1.png
  AssetGenImage get onBoarding1 =>
      const AssetGenImage('assets/on_boarding/on_boarding1.png');

  /// File path: assets/on_boarding/on_boarding2.png
  AssetGenImage get onBoarding2 =>
      const AssetGenImage('assets/on_boarding/on_boarding2.png');

  /// File path: assets/on_boarding/on_boarding3.png
  AssetGenImage get onBoarding3 =>
      const AssetGenImage('assets/on_boarding/on_boarding3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icArrowNext,
        icArrowPre,
        icDot,
        icDotSlide,
        onBoarding1,
        onBoarding2,
        onBoarding3
      ];
}

class Assets {
  Assets._();

  static const $AssetsAuthGen auth = $AssetsAuthGen();
  static const AssetGenImage icBack = AssetGenImage('assets/ic_back.png');
  static const AssetGenImage icEmail = AssetGenImage('assets/ic_email.png');
  static const AssetGenImage icEyeOff = AssetGenImage('assets/ic_eye_off.png');
  static const AssetGenImage icLock = AssetGenImage('assets/ic_lock.png');
  static const AssetGenImage icPhone = AssetGenImage('assets/ic_phone.png');
  static const AssetGenImage icUser = AssetGenImage('assets/ic_user.png');
  static const $AssetsOnBoardingGen onBoarding = $AssetsOnBoardingGen();

  /// List of all assets
  static List<AssetGenImage> get values =>
      [icBack, icEmail, icEyeOff, icLock, icPhone, icUser];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
