



import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/wheel_of_life/models/wheel_objective.dart';

class WheelObjectiveStyles {

  WheelObjective objective;
  WheelObjectiveStyles({required this.objective});
  Color relatedColor() {
    return {
      "mission": Color(0xFFE57373),
      "growth": Color(0xFFBA1BD4),

      "money": Color(0xFF4FF77F),

      "friends": Color(0xFFCB79BC),
      "family": Color(0xFFF9A4FF),
      "romance": Color(0xFFB64D7B),
      "body": Color(0xFF4DD0E1),
      "mind": Color(0xFF81C0C7),
      "morals": Color(0xFF81C784),
    }[objective.name.toLowerCase()] ?? Colors.grey;
  }
}