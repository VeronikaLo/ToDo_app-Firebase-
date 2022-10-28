import 'package:auto_route/auto_route.dart';

import '../signup/signup_page.dart';
import '../home/home_page.dart';


@MaterialAutoRouter(
  routes:<AutoRoute>[
    AutoRoute(page: SignUpPage, initial: true),
    AutoRoute(page: HomePage , initial: false),
  ]
)


class $AppRouter{}