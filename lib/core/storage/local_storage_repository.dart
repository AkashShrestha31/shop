import 'package:get_storage/get_storage.dart';

abstract class LocalRepo {
  String getToken();
  void storeToken(String token);
  // Future<String> getUserProfile();

}

class LocalRepoImpl implements LocalRepo {
  @override
  String getToken() {
    // TODO: implement getToken
    final box = GetStorage();
    return box.read('access_token') ?? "";
  }

  @override
  void storeToken(String token) {
    // TODO: implement storeToken
    final box = GetStorage();
    box.write('access_token', token);
  }
}

LocalRepoImpl localRepoImpl = LocalRepoImpl();
