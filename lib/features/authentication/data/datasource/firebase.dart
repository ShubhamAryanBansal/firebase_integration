

abstract class FirebaseDataSource{
  Future<bool> createUser({required String name, required String email, required String password});
  Future<bool> loginUser({required String email, required String password});
  Future<String> getRemoteConfig();
}