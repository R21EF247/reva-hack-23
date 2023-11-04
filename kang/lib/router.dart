import 'package:auto_route/auto_route.dart';
import 'package:kang/views/homepage.dart';
import 'package:kang/views/search.dart';
import 'package:kang/views/profile.dart';
import 'package:kang/views/start.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AutoRouter extends _$AutoRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MyAppRoute.page, path: "/", initial: true, children: [
          AutoRoute(page: HomeRoute.page, path: "home"),
          AutoRoute(page: SearchRoute.page, path: "search"),
          AutoRoute(page: ProfileRoute.page, path: "profile"),
        ]),
      ];
}
