part of 'route_config.dart';

@TypedGoRoute<LoginPageRoute>(path: '/login')
@immutable
class LoginPageRoute extends GoRouteData with $LoginPageRoute {
  const LoginPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}
