import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sipalma/src/application/hive/hive_service.dart';
import 'package:sipalma/src/domain/auth/auth.dart';
import 'src/app.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AuthAdapter());
  await HiveService().openBox();
  runApp(const ProviderScope(child: SipalmaApp()));
}
