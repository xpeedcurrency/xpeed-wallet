import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_xpeed_core/flutter_xpeed_core.dart';

import 'package:xpeed_wallet_flutter/model/db/appdb.dart';
import 'package:xpeed_wallet_flutter/model/db/account.dart';
import 'package:xpeed_wallet_flutter/appstate_container.dart';
import 'package:xpeed_wallet_flutter/localization.dart';
import 'package:xpeed_wallet_flutter/service_locator.dart';

class XpeedUtil {
  static String seedToPrivate(Map<dynamic, dynamic> params) {
    return NanoKeys.seedToPrivate(params['seed'], params['index']);
  }

  Future<String> seedToPrivateInIsolate(String seed, int index) async {
    return await compute(XpeedUtil.seedToPrivate, {'seed':seed, 'index':index});
  }

  static String seedToAddress(Map<dynamic, dynamic> params) {
    return NanoAccounts.createAccount(NanoAccountType.XPD, NanoKeys.createPublicKey(seedToPrivate(params)));
  }

  Future<String> seedToAddressInIsolate(String seed, int index) async {
    return await compute(XpeedUtil.seedToAddress, {'seed':seed, 'index':index});
  }

  Future<void> loginAccount(BuildContext context) async {
    Account selectedAcct = await sl.get<DBHelper>().getSelectedAccount();
    if (selectedAcct == null) {
      selectedAcct = Account(index: 0, lastAccess: 0, name: AppLocalization.of(context).defaultAccountName, selected: true);
      await sl.get<DBHelper>().saveAccount(selectedAcct);
    }
    await StateContainer.of(context).updateWallet(account: selectedAcct);
  }
}
