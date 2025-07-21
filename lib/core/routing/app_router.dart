import 'package:go_router/go_router.dart';
import 'package:ui_showcase/core/helpers/constants.dart';
import 'package:ui_showcase/core/routing/routes.dart';
import 'package:ui_showcase/features/auth/view/login_view.dart';
import '../../features/home/view/home_view.dart';

class AppRouter {
  static GoRouter getRouter(bool rememberMe) {
    return GoRouter(
      initialLocation: rememberMe ? Routes.home : Routes.login,
      routes: [
        GoRoute(
          name: Routes.home,
          path: Routes.home,
          builder: (context, state) {
            final extra = state.extra as List<String>;
            return HomeView(title: extra);
          },
        ),
        GoRoute(
          name: Routes.login,
          path: Routes.login,
          builder: (context, state) => const LoginView(),
        ),
      ],
    );
  }
}
