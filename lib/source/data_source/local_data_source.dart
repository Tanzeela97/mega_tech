import 'dart:convert';

import 'package:megatech/source/core/error.dart';
import 'package:megatech/source/model/login_model.dart';
import 'package:megatech/source/model/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalDataSource {
  const ILocalDataSource();
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<SessionModel> getSession();

  Future<void> cacheSession(LoginModel loginModel);
}
// ignore: constant_identifier_names
const CACHED_SESSION = 'CACHED_SESSION';

class LocalDataSource extends ILocalDataSource{
  final SharedPreferences sharedPreferences;
  const LocalDataSource({required this.sharedPreferences});
  @override
  Future<void> cacheSession(LoginModel loginModel)async {
    await sharedPreferences.setString(
      CACHED_SESSION,
      json.encode(loginModel.toJson()),
    );
  }

  @override
  Future<SessionModel> getSession() async{
    final jsonString = sharedPreferences.getString(CACHED_SESSION);
    if (jsonString != null) {
      return await Future.value(SessionModel.fromJson(json.decode(jsonString)));
    } else {
      throw const CacheException();
    }
  }

}