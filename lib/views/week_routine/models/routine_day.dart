



import 'package:personal_dashboard/views/week_routine/models/routine_item.dart';

class RoutineDay {
  final List<RoutineItem> routineItems;
  final String day;


  RoutineDay({required this.routineItems, required this.day});


  RoutineDay copyWith({
    List<RoutineItem>? routineItems,
    String? day,
  }) {
    return RoutineDay(
      routineItems: routineItems ?? this.routineItems,
      day: day ?? this.day,
    );
  }

}