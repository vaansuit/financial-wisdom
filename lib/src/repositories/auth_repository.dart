import '../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> signinWithEmailAndPassword(String email, String password);
}
