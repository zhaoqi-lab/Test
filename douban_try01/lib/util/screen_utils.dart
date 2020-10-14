import 'package:flutter/material.dart';
import 'dart:ui' as ui;


///默认设计稿尺寸（单位 dp or pt）
double _designW = 360.0;
double _designH = 640.0;
double _designD = 3.0;  //density 像素密度


/// 配置设计稿尺寸 屏幕 宽，高，密度。
void setDesignWHD(double w, double h, {double density = 3.0}) {
  _designW = w;
  _designH = h;
  _designD = density;
}

class ScreenUtils {
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  double _screenDensity = 0.0;
  double _statusBarHeight = 0.0;
  double _bottomBarHeight = 0.0;
  double _appBarHeight = 0.0;
  MediaQueryData _mediaQueryData;

  static final ScreenUtils _singleton = ScreenUtils();

  static ScreenUtils getInstance() {
    _singleton._init();
    return _singleton;
  }

  _init() {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    if (_mediaQueryData != mediaQuery) {
      _mediaQueryData = mediaQuery;
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _screenDensity = mediaQuery.devicePixelRatio;
      _statusBarHeight = mediaQuery.padding.top;
      _bottomBarHeight = mediaQuery.padding.bottom;
      _appBarHeight = kToolbarHeight;
    }
  }

  /// 屏幕宽
  double get screenWidth => _screenWidth;

  /// 屏幕高
  double get screenHeight => _screenHeight;

  /// appBar高
  double get appBarHeight => _appBarHeight;

  /// 屏幕像素密度
  double get screenDensity => _screenDensity;

  /// 状态栏高度
  double get statusBarHeight => _statusBarHeight;

  double get bottomBarHeight => _bottomBarHeight;


  MediaQueryData get mediaQueryData => _mediaQueryData;

  /// 当前屏幕宽
  static double screenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }

  /// 当前屏幕 高
  static double screenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }

  /// 当前屏幕 像素密度
  static double getScreenDensity(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.devicePixelRatio;
  }

  /// 当前状态栏高度
  static double getStatusBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.top;
  }

  /// 当前BottomBar高度
  static double getBottomBarH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.padding.bottom;
  }

  /// 当前MediaQueryData
  static MediaQueryData getMediaQueryData(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery;
  }

  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  static double getScaleW(BuildContext context, double size) {
    if (context == null || screenW(context) == 0.0) return size;
    return size * screenW(context) / _designW;
  }

  /// 返回根据屏幕高适配后尺寸 （单位 dp or pt）
  static double getScaleH(BuildContext context, double size) {
    if (context == null || screenH(context) == 0.0) return size;
    return size * screenH(context) / _designH;
  }

  /// 返回根据屏幕宽适配后字体尺寸
  static double getScaleSp(BuildContext context, double fontSize) {
    if (context == null || getScreenDensity(context) == 0.0) return fontSize;
    return fontSize * screenW(context) / _designW;
  }

  /// 设备方向(portrait, landscape)
  static Orientation getOrientation(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.orientation;
  }

  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  double getWidth(double size) {
    return _screenWidth == 0.0 ? size : (size * _screenWidth / _designW);
  }

  /// 返回根据屏幕高适配后尺寸（单位 dp or pt）
  double getHeight(double size) {
    return _screenHeight == 0.0 ? size : (size * _screenHeight / _designH);
  }

  /// 返回根据屏幕宽适配后尺寸（单位 dp or pt）
  double getWidthPx(double sizePx) {
    return _screenWidth == 0.0
        ? (sizePx / _designD)
        : (sizePx * _screenWidth / (_designW * _designD));
  }

  /// 返回根据屏幕高适配后尺寸（单位 dp or pt）
  double getHeightPx(double sizePx) {
    return _screenHeight == 0.0
        ? (sizePx / _designD)
        : (sizePx * _screenHeight / (_designH * _designD));
  }

  /// 返回根据屏幕宽适配后字体尺寸
  double getSp(double fontSize) {
    if (_screenDensity == 0.0) return fontSize;
    return fontSize * _screenWidth / _designW;
  }
}