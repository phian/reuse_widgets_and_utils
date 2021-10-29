import 'dart:io';
import 'package:flutter/foundation.dart';

class PlatformCheckingUtils {
  static bool get isWeb => kIsWeb;

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  static bool get isWindows => Platform.isWindows;

  static bool get isMacOS => Platform.isMacOS;

  static bool get isLinux => Platform.isLinux;

  static bool get isFuchsia => Platform.isFuchsia;
}
