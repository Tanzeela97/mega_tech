import 'package:megatech/constant/api_string.dart';
import 'package:megatech/source/core/api_client.dart';
import 'package:megatech/source/model/login_model.dart';

abstract class IRemoteDataSource {
  const IRemoteDataSource();

  Future<LoginModel> getLogin(String name, String password);
}

class RemoteDataSource extends IRemoteDataSource {
  final ApiClient apiClient;

  const RemoteDataSource({required this.apiClient});

  @override
  Future<LoginModel> getLogin(String name, String password) async {
    var uri = Uri.https(ApiString.baseUrl, ApiString.getLogin);

    final response = await apiClient
        .post(uri, params: {"userID": "khalid", "pass": "khalid@123"});
    print(response);
    return LoginModel.fromJson(response);
  }
}
