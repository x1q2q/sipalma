import 'package:hive/hive.dart';
import 'package:sipalma/src/domain/auth/auth.dart';

class HiveService {
  static const String userBoxName = 'userBox';
  static const String userKey = 'activeUser';

  Future<void> openBox() async {
    await Hive.openBox<Auth>(userBoxName);
  }

  Box<Auth> get userBox => Hive.box<Auth>(userBoxName);

  Future<void> saveActiveUser(Auth user) async {
    await userBox.put(userKey, user);
  }

  Auth? getActiveUser() {
    return userBox.get(userKey);
  }

  Future<void> deleteUser() async {
    await userBox.delete(userKey);
  }
}
