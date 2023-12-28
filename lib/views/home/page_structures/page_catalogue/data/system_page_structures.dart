

import 'package:personal_dashboard/views/home/page_structures/page_structure.dart';
import 'package:personal_dashboard/views/todo_bullet_points/view/todo_bullet_points_view.dart';
import 'package:personal_dashboard/views/wheel_of_life/view/wheel_of_life_view.dart';

List<PageStructure>
structures = [
  PageStructure(
      name: "Wheel of Life",
      child: WheelOfLifeView()),


  PageStructure(child:
  TODOBulletPointsView(), name: "Bullet Point TODO"),

];
