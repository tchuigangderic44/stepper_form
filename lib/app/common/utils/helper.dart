// Responsive Function

import 'package:flutter/material.dart';

final deviceSize = MediaQueryData.fromView(
  WidgetsBinding.instance.platformDispatcher.views.first,
).size;

const designSize = Size(360, 800);
final isLargeScreen = deviceSize.width >= 500;

double safeAreaHeight(BuildContext context) =>
    MediaQuery.of(context).padding.top;

extension XResponsiveSize on num {
  /// [h] is used to get responsive height of a container
  double get h {
    final maxHeight = this + this * .025;
    final minHeight = this - this * .1;
    final respSize = deviceSize.height * (this / designSize.height);
    return respSize > maxHeight
        ? maxHeight
        : respSize < minHeight
            ? minHeight
            : respSize;
  }

  /// [w] is used to get responsive width of a container
  double get w {
    final maxWidth = this + this * .25;
    final minWidth = this - this * .15;
    final respSize = deviceSize.width * (this / designSize.width);
    return respSize > maxWidth
        ? maxWidth
        : respSize < minWidth
            ? minWidth
            : respSize;
  }

  /// [hp] is used for horizontal padding
  double get hp {
    final respSize = deviceSize.width * (this / designSize.width);
    return respSize;
  }

  /// [vp] is used for vertical padding
  double get vp {
    final respSize = deviceSize.height * (this / designSize.height);
    return respSize;
  }

  /// [s] is used to get responsive font size
  double get s {
    const minFontSize = 12.0; // Minimum allowed font size
    final maxFontSize = this; // Maximum font size (set by you)
    final respSize = deviceSize.shortestSide * (this / designSize.shortestSide);
    return respSize.clamp(minFontSize, maxFontSize).toDouble(); // Ensure within range
  }

}
/// Keys used when dealing with localstorage
class AppLocalStorageKey {
  static const lang = 'lang';
  static const authLocalData = 'stepper';
}

// Load Constant
class AppConstant {
  static const en = 'en';
  static const fr = 'fr';
}

enum Status { loading, success, failure, init }

extension XStatus on Status {
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
  bool get isInitial => this == Status.init;
}

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    final phoneRegex =
        RegExp(r'^(?:\+?(?:237)?6(?:7\d{7}|5[0-4]\d{6}|8[0-4]\d{6}))$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid mtn phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your secret code';
    }
    if (value.length != 5) {
      return 'The momo secret code should be 5 characters long';
    }
    return null;
  }

  String? validateString(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot contain a null value.';
    }
    return null;
  }