import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';


import './view/Home_page.dart';
import 'package:personal_dashboard/routes/app_route.dart';

class HomeRoute extends AppRoute {

  // calls route page once, to add to the widget
  GoRoute getRoute() {
    return GoRoute(
      path: routePath,
      builder: getPage,
    );
  }

  Widget getPage(BuildContext context, GoRouterState state) {
    return HomePage();
  }


  String get routePath => "/Home";
}