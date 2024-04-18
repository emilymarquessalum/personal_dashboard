






import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


abstract class AppRoute {

  // calls getRoute, to add to the tree of routes
  GoRoute getRoute();

  Widget getPage(BuildContext context, GoRouterState state);

  String get routePath;
}