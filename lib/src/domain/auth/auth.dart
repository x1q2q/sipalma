import 'package:hive/hive.dart';

part 'auth.g.dart';

@HiveType(typeId: 0)
class Auth extends HiveObject {
  @HiveField(0)
  late int idUser;
  @HiveField(1)
  late String name;
}
