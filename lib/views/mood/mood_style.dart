




import 'package:personal_dashboard/views/mood/models/mood_record.dart';
import 'package:flutter/material.dart';

class MoodStyle {

  final MoodType moodType;
  const MoodStyle({required this.moodType});
  IconData icon() {
    return {
      MoodType.reallyBad: Icons.sentiment_very_dissatisfied,
      MoodType.bad: Icons.sentiment_dissatisfied,
      MoodType.neutral: Icons.sentiment_neutral,
      MoodType.good: Icons.sentiment_satisfied,
      MoodType.reallyGood: Icons.sentiment_very_satisfied,
    }[moodType] ?? Icons.add;
  }
}