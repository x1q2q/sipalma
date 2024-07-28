import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'src/app.dart';

void main() {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: SipalmaApp()));
}
