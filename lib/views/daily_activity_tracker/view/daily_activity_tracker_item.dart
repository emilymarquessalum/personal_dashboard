





import 'package:flutter/material.dart';
import 'package:personal_dashboard/shared/themes/icons_theme.dart';

class DailyActivityTrackerItem extends StatefulWidget {
  const DailyActivityTrackerItem({super.key});

  @override
  State<DailyActivityTrackerItem> createState() => _DailyActivityTrackerItemState();
}

class _DailyActivityTrackerItemState extends State<DailyActivityTrackerItem> {

  List dayTrack = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DateTime now = DateTime.now();
    int daysInMonth = DateUtils.getDaysInMonth(now.year, now.month);

    for(int i = 1; i <= daysInMonth; i++) {
      dayTrack.add(false);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [

            //Expanded(flex: 6, child: Container()),

            Expanded(
              child: Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(

                    IconsTheme.complete
                  ))
                ],
              )
            ),
          ],
        )
      ],
    );
  }
}
