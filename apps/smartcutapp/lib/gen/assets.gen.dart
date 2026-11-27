// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Montserrat-Black.ttf
  String get montserratBlack => 'assets/fonts/Montserrat-Black.ttf';

  /// File path: assets/fonts/Montserrat-BlackItalic.ttf
  String get montserratBlackItalic => 'assets/fonts/Montserrat-BlackItalic.ttf';

  /// File path: assets/fonts/Montserrat-Bold.ttf
  String get montserratBold => 'assets/fonts/Montserrat-Bold.ttf';

  /// File path: assets/fonts/Montserrat-BoldItalic.ttf
  String get montserratBoldItalic => 'assets/fonts/Montserrat-BoldItalic.ttf';

  /// File path: assets/fonts/Montserrat-ExtraBold.ttf
  String get montserratExtraBold => 'assets/fonts/Montserrat-ExtraBold.ttf';

  /// File path: assets/fonts/Montserrat-ExtraBoldItalic.ttf
  String get montserratExtraBoldItalic =>
      'assets/fonts/Montserrat-ExtraBoldItalic.ttf';

  /// File path: assets/fonts/Montserrat-ExtraLight.ttf
  String get montserratExtraLight => 'assets/fonts/Montserrat-ExtraLight.ttf';

  /// File path: assets/fonts/Montserrat-ExtraLightItalic.ttf
  String get montserratExtraLightItalic =>
      'assets/fonts/Montserrat-ExtraLightItalic.ttf';

  /// File path: assets/fonts/Montserrat-Italic.ttf
  String get montserratItalic => 'assets/fonts/Montserrat-Italic.ttf';

  /// File path: assets/fonts/Montserrat-Light.ttf
  String get montserratLight => 'assets/fonts/Montserrat-Light.ttf';

  /// File path: assets/fonts/Montserrat-LightItalic.ttf
  String get montserratLightItalic => 'assets/fonts/Montserrat-LightItalic.ttf';

  /// File path: assets/fonts/Montserrat-Medium.ttf
  String get montserratMedium => 'assets/fonts/Montserrat-Medium.ttf';

  /// File path: assets/fonts/Montserrat-MediumItalic.ttf
  String get montserratMediumItalic =>
      'assets/fonts/Montserrat-MediumItalic.ttf';

  /// File path: assets/fonts/Montserrat-Regular.ttf
  String get montserratRegular => 'assets/fonts/Montserrat-Regular.ttf';

  /// File path: assets/fonts/Montserrat-SemiBold.ttf
  String get montserratSemiBold => 'assets/fonts/Montserrat-SemiBold.ttf';

  /// File path: assets/fonts/Montserrat-SemiBoldItalic.ttf
  String get montserratSemiBoldItalic =>
      'assets/fonts/Montserrat-SemiBoldItalic.ttf';

  /// File path: assets/fonts/Montserrat-Thin.ttf
  String get montserratThin => 'assets/fonts/Montserrat-Thin.ttf';

  /// File path: assets/fonts/Montserrat-ThinItalic.ttf
  String get montserratThinItalic => 'assets/fonts/Montserrat-ThinItalic.ttf';

  /// File path: assets/fonts/OFL.txt
  String get ofl => 'assets/fonts/OFL.txt';

  /// List of all assets
  List<String> get values => [
    montserratBlack,
    montserratBlackItalic,
    montserratBold,
    montserratBoldItalic,
    montserratExtraBold,
    montserratExtraBoldItalic,
    montserratExtraLight,
    montserratExtraLightItalic,
    montserratItalic,
    montserratLight,
    montserratLightItalic,
    montserratMedium,
    montserratMediumItalic,
    montserratRegular,
    montserratSemiBold,
    montserratSemiBoldItalic,
    montserratThin,
    montserratThinItalic,
    ofl,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.png
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.png');

  /// File path: assets/images/factory_bg.png
  AssetGenImage get factoryBg =>
      const AssetGenImage('assets/images/factory_bg.png');

  /// File path: assets/images/favicon.png
  AssetGenImage get favicon => const AssetGenImage('assets/images/favicon.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_login.png
  AssetGenImage get logoLogin =>
      const AssetGenImage('assets/images/logo_login.png');

  /// File path: assets/images/small_logo.png
  AssetGenImage get smallLogo =>
      const AssetGenImage('assets/images/small_logo.png');

  /// File path: assets/images/wh.jpg
  AssetGenImage get wh => const AssetGenImage('assets/images/wh.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    avatar,
    factoryBg,
    favicon,
    logo,
    logoLogin,
    smallLogo,
    wh,
  ];
}

abstract final class Assets {
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
