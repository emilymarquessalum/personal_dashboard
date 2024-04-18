import 'package:personal_dashboard/views/mood/bloc/mood_selection_bloc.dart';
import 'package:personal_dashboard/views/mood/models/mood_record.dart';
import 'package:personal_dashboard/views/mood/mood_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodCard extends StatelessWidget {
  final MoodType moodType;

  const MoodCard({super.key, required this.moodType,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodSelectionBloc, MoodSelectionState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<MoodSelectionBloc>().add(MoodWasSelectedEvent(moodType: moodType));
          },
          child: MoodCardIcon(
            moodType: moodType,
            color: moodColor(context),
          )
        );
      },
    );
  }

  Color moodColor(BuildContext context) {
    return context.read<MoodSelectionBloc>().selectedMoodType == moodType
              ? Theme
              .of(context)
              .colorScheme
              .secondary
              :
          Theme
              .of(context)
              .colorScheme
              .primary;
  }
}


class MoodCardIcon extends StatelessWidget {
  final MoodType moodType;
  final Color color;
  const MoodCardIcon({super.key, required this.moodType, required this.color});

  @override
  Widget build(BuildContext context) {

    MoodStyle moodStyle = MoodStyle(moodType: moodType);
    return Icon(
      moodStyle.icon(),
      color: color,
    );
  }
}
