import 'dart:io';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:xpeed_wallet_flutter/appstate_container.dart';
import 'package:xpeed_wallet_flutter/localization.dart';

class BiometricUtil {
  ///
  /// hasBiometrics()
  /// 
  /// @returns [true] if device has fingerprint/faceID available and registered, [false] otherwise
  Future<bool> hasBiometrics() async {
    LocalAuthentication localAuth = new LocalAuthentication();
    bool canCheck = await localAuth.canCheckBiometrics;
    if (canCheck) {
      List<BiometricType> availableBiometrics = await localAuth.getAvailableBiometrics();
      if (Platform.isIOS && availableBiometrics.contains(BiometricType.face)) {
        return true;
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        return true;
      }
    }
    return false;
  }

  ///
  /// authenticateWithBiometrics()
  /// 
  /// @param [message] Message shown to user in FaceID/TouchID popup
  /// @returns [true] if successfully authenticated, [false] otherwise
  Future<bool> authenticateWithBiometrics(BuildContext context, String message) async {
    bool hasBiometricsEnrolled = await hasBiometrics();
    if (hasBiometricsEnrolled) {
      LocalAuthentication localAuth = new LocalAuthentication();

      var iosStrings = IOSAuthMessages(
        cancelButton: AppLocalization.of(context).cancel,
        goToSettingsButton: AppLocalization.of(context).settingsHeader,
        goToSettingsDescription: 'Please set up your Touch ID.',
        lockOut: 'Please reenable your Touch ID'
      );

      var andStrings = AndroidAuthMessages(
        cancelButton: AppLocalization.of(context).cancel,
        goToSettingsButton: AppLocalization.of(context).settingsHeader,
        goToSettingsDescription: 'Please set up your Touch ID.',
        fingerprintNotRecognized: AppLocalization.of(context).fingerprintNotRecognized,
        fingerprintSuccess: AppLocalization.of(context).fingerprintSuccess,
        fingerprintHint:  AppLocalization.of(context).touchhint
      );
      return await localAuth.authenticateWithBiometrics(
        localizedReason: message,
        useErrorDialogs: false,
        dialogTheme: StateContainer.of(context).curTheme.fpTheme,
        iOSAuthStrings: iosStrings,
        androidAuthStrings: andStrings
      );
    }
    return false;
  }
}