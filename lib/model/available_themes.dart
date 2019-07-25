import 'package:flutter/material.dart';
// import 'package:xpeed_wallet_flutter/localization.dart';
import 'package:xpeed_wallet_flutter/themes.dart';
import 'package:xpeed_wallet_flutter/model/setting_item.dart';

enum ThemeOptions { XPEEDTHEME, TITANIUM, INDIUM, NEPTUNIUM, XPEED }

/// Represent notification on/off setting
class ThemeSetting extends SettingSelectionItem {
  ThemeOptions theme;

  ThemeSetting(this.theme);

  String getDisplayName(BuildContext context) {
    switch (theme) {
      case ThemeOptions.XPEED:
        return "Xpeed";
      case ThemeOptions.NEPTUNIUM:
        return "Neptunium";
      case ThemeOptions.INDIUM:
        return "Indium";
      case ThemeOptions.TITANIUM:
        return "Titanium";
      case ThemeOptions.XPEEDTHEME:
      default:
        return "Xpeed";
    }
  }

  BaseTheme getTheme() {
    switch (theme) {
      case ThemeOptions.XPEED:
        return XpeedTheme();
      case ThemeOptions.NEPTUNIUM:
        return NeptuniumTheme();
      case ThemeOptions.INDIUM:
        return IndiumTheme();
      case ThemeOptions.TITANIUM:
        return TitaniumTheme();
      case ThemeOptions.XPEEDTHEME:
        return XpeedTheme();
      default:
        return XpeedTheme();
    }    
  }

  // For saving to shared prefs
  int getIndex() {
    return theme.index;
  }
}