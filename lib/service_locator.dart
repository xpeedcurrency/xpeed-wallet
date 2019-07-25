import 'package:get_it/get_it.dart';

import 'package:xpeed_wallet_flutter/model/db/appdb.dart';
import 'package:xpeed_wallet_flutter/model/vault.dart';
import 'package:xpeed_wallet_flutter/network/account_service.dart';
import 'package:xpeed_wallet_flutter/util/legacyutil.dart';
import 'package:xpeed_wallet_flutter/util/HapticUtil.dart';
import 'package:xpeed_wallet_flutter/util/biometrics.dart';
import 'package:xpeed_wallet_flutter/util/sharedprefsutil.dart';

GetIt sl = new GetIt();

void setupServiceLocator() {
  sl.registerLazySingleton<AccountService>(() => AccountService());
  sl.registerLazySingleton<DBHelper>(() => DBHelper());
  sl.registerLazySingleton<LegacyMigration>(() => LegacyMigration());
  sl.registerLazySingleton<HapticUtil>(() => HapticUtil());
  sl.registerLazySingleton<BiometricUtil>(() => BiometricUtil());
  sl.registerLazySingleton<Vault>(() => Vault());
  sl.registerLazySingleton<SharedPrefsUtil>(() => SharedPrefsUtil());
}  