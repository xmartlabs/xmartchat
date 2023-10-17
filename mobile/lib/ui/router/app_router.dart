import 'package:auto_route/auto_route.dart';
import 'package:flutter_template/core/repository/session_repository.dart';
import 'package:flutter_template/ui/router/app_router_guards.dart';
import 'package:flutter_template/ui/section/section_router.dart';
import 'package:flutter_template/ui/sign_in/sign_in_screen.dart';
import 'package:flutter_template/ui/sign_up/sign_up_screen.dart';
import 'package:flutter_template/ui/home/home_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|Router,Route',
)
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes;

  ReevaluateListenable authReevaluateListenable;

  AppRouter(SessionRepository sessionRepository)
      : authReevaluateListenable = ReevaluateListenable.stream(
          sessionRepository.status.distinct().skip(1),
        ),
        routes = [
          AutoRoute(
            page: UnauthenticatedSectionRoute.page,
            path: '/',
            guards: [UnauthenticatedGuard(sessionRepository)],
            children: [
              AutoRoute(path: '', page: SignUpRoute.page),
              AutoRoute(path: 'login', page: SignInRoute.page),
            ],
          ),
          AutoRoute(
            page: AuthenticatedSectionRoute.page,
            guards: [AuthenticatedGuard(sessionRepository)],
            path: '/',
            children: [
              AutoRoute(path: '', page: HomeRoute.page),
            ],
          ),
        ];
}
