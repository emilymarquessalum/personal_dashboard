




// GoRouter configuration for system routes
import 'package:go_router/go_router.dart';
import 'package:personal_dashboard/views/home/home_router.dart';

import '../views/milestones_trail/milestones_trail_route.dart';
import 'app_route.dart';

GoRouter appRouter({required String initialRoute}) {
  return GoRouter(
    initialLocation: initialRoute,
    routes: [
      for (AppRoute route in getModuleRoutes()) route.getRoute(),
    ],
  );
}

List<AppRoute> getModuleRoutes() => [

  MilestonesTrailRoute(),


  HomeRoute(),


    ];
