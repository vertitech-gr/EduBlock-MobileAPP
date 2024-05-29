import 'package:edublock/data/network/apis/wallets/wallets_api.dart';
import 'package:edublock/data/sharedpref/shared_preference_helper.dart';
import 'package:edublock/domain/repository/wallets_repository/wallets_repository.dart';

class WalletsRepositoryImpl extends WalletsRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final WalletsApi _walletsApi;

  // constructor
  WalletsRepositoryImpl(this._sharedPrefsHelper, this._walletsApi);

}