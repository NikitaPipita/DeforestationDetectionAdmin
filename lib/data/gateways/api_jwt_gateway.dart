import 'api_provider.dart';

class ApiAuthenticationGateWay {
  final ApiProvider _apiProvider;

  ApiAuthenticationGateWay(
    this._apiProvider,
  );

  Future<void> authentication(String email, String password) async {
    await _apiProvider.authentication(email, password);
  }
}
