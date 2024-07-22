import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routing/app_router.dart';
import 'res/styles/index.dart';

class SipalmaApp extends ConsumerWidget {
  const SipalmaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouter);
    return MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
            colorSchemeSeed: AppColors.primary,
            unselectedWidgetColor: Colors.grey,
            appBarTheme: const AppBarTheme(
                backgroundColor: AppColors.primary,
                elevation: 0.2,
                foregroundColor: Colors.white,
                centerTitle: false)),
        debugShowCheckedModeBanner: false);
  }
}
