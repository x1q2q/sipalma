import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sipalma/src/presentation/home/home_page.dart';
import 'package:sipalma/src/presentation/auth/login_page.dart';
import 'package:sipalma/src/presentation/announcement/announcement_page.dart';
import 'package:sipalma/src/presentation/billing/billing_page.dart';
import 'package:sipalma/src/presentation/payment/payment_page.dart';
import 'package:sipalma/src/presentation/profile/profile_page.dart';
import 'package:sipalma/src/presentation/profile/edit_profile_page.dart';
import 'package:sipalma/src/application/hive/hive_service.dart';
import 'not_found_page.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoutes {
  login,
  home,
  announcement,
  billing,
  payment,
  profile,
  editProfile
}

final goRouter = Provider<GoRouter>((ref) {
  return GoRouter(
      navigatorKey: _key,
      debugLogDiagnostics: true,
      initialLocation: '/home',
      routes: <RouteBase>[
        GoRoute(
            path: '/${AppRoutes.login.name}',
            name: AppRoutes.login.name,
            builder: (context, state) {
              return const LoginPage();
            }),
        GoRoute(
            path: '/${AppRoutes.home.name}',
            name: AppRoutes.home.name,
            builder: (context, state) {
              return const HomePage();
            }),
        GoRoute(
            path: '/${AppRoutes.announcement.name}',
            name: AppRoutes.announcement.name,
            builder: (context, state) {
              return const AnnouncementPage();
            }),
        GoRoute(
            path: '/${AppRoutes.billing.name}',
            name: AppRoutes.billing.name,
            builder: (context, state) {
              return const BillingPage();
            }),
        GoRoute(
            path: '/${AppRoutes.payment.name}',
            name: AppRoutes.payment.name,
            builder: (context, state) {
              return const PaymentPage();
            }),
        GoRoute(
            path: '/${AppRoutes.profile.name}',
            name: AppRoutes.profile.name,
            builder: (context, state) {
              return const ProfilePage();
            }),
        GoRoute(
            path: '/${AppRoutes.editProfile.name}',
            name: AppRoutes.editProfile.name,
            builder: (context, state) {
              return const EditProfilePage();
            })
      ],
      redirect: (context, state) async {
        final isAuthenticated = HiveService().getActiveUser();
        // if hiveBox not null-> return `null` to redirected the initialLoc [which is home]
        return (isAuthenticated != null) ? null : '/${AppRoutes.login.name}';
      },
      errorPageBuilder: (context, state) =>
          const NoTransitionPage(child: NotFoundPage()));
});
