

import 'package:personal_dashboard/views/home/page_structures/models/page_structure.dart';
import 'package:personal_dashboard/views/home/page_structures/models/page_structure_category.dart';
import 'package:personal_dashboard/views/maintenance_and_progression/view/maintenance_and_progression_view.dart';
import 'package:personal_dashboard/views/pomodoro_timer/view/pomodoro_timer_text_counter.dart';
import 'package:personal_dashboard/views/portfolio/view/portfolio_body.dart';
import 'package:personal_dashboard/views/week_routine/view/week_routine_view.dart';

import '../../../../dinosaur/popups/dinosaur_species_pick_popup.dart';
import '../../../../generic_tools/notes/view/notes_list_view.dart';
import '../../../../generic_tools/shortcuts/view/home_link_view.dart';
import '../../../../generic_tools/todo_bullet_points/view/todo_bullet_points_view.dart';
import '../../../../productivity/wheel_of_life/view/wheel_of_life_view.dart';


class SystemPageCataloguer {

  static List<PageStructureCategory> categories = [

    PageStructureCategory(name: "Productivity",
        structures: [
          PageStructure(
            name: "Wheel of Life",
            child: WheelOfLifeView(),
            description: "Tool to help you find balance in your life. "
                +
                "Adviceble to use at least once a year, or whenever feeling lost.",

          ),


          PageStructure(child:
          PomodoroTimerTextCounter(), name: "Pomodoro"),


          PageStructure(child:
          WeekRoutineView(), name: "Routine"),
          PageStructure(child:
          MaintenanceAndProgressionView(), name: "Maintenance x Progression"),


        ]),

    PageStructureCategory(name: "Utility",
        structures: [
          PageStructure(child:
          TODOBulletPointsView(), name: "Bullet Point TODO"),

          PageStructure(child:
          SystemShortcutsView(), name: "Quick Links"),

          PageStructure(child:
          NotesListView(), name: "Notes"),

        ]),

    PageStructureCategory(name: "Silly",
        structures: [
          PageStructure(child:
          DinosaurSpeciesPickPopup(), name: "Dinossaur"),
        ]),
PageStructureCategory(name: "WIP",
        structures: [
          PageStructure(
  useWholeScreen: true,
            child:
          PortfolioBody(), name: "Portfolio",

          ),
        ]),

  ];
}

