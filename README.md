<div align="center">
    <img src="/xpeedcurrency/xpeed-wallet/raw/master/images/xpeed_layout.png" alt="Logo" width='500px' height='auto'/>
</div>


---

# XPEED WALLET - Fast, Robust & Secure

XPEED WALLET is a cross-platform mobile wallet for the NANO cryptocurrency. It is written in Dart.

| Link | Description |
| :----- | :------ |
[XPEEDCOIN.COM](https://xpeedcoin.com) | Natrium Homepage
[XPEED WALLET on AppStore](https://apps.apple.com/app/xpeed-wallet-new/id1462047661) | for iOS
[XPEED WALLET on PlayStore](https://play.google.com/store/apps/details?id=co.xpeed.xpeedfwallet) | for Android



## Have a question?

If you need any help, feel free to file an issue if you do not manage to find a solution.

## License

XPEED WALLET is released under the BSD-2 License

### Update translations:

```
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/localization.dart
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/l10n \
   --no-use-deferred-loading lib/localization.dart lib/l10n/intl_*.arb
```

