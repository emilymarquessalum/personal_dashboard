import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_dashboard/views/milestones_trail/view/milestones_page.dart';

import '../../routes/app_route.dart';


class MilestonesTrailRoute extends AppRoute {

  // calls route page once, to add to the widget
  GoRoute getRoute() {
    return GoRoute(
      path: routePath,
      builder: getPage,
    );
  }

  Widget getPage(BuildContext context, GoRouterState state) {
    return MilestonesPage();
  }


  String get routePath => "/MilestonesTrail";
}