




import 'package:flutter/cupertino.dart';

class TipsForRestingBody extends StatelessWidget {
  const TipsForRestingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text("DopaMenu"),

        Text(
          '''
          entrées - exciting/fulfilling activities
desserts - overdone go tos
appetizers - quick dopamine/low effort
sides - things to add to activities

specials - occaisonal high dopamime things (temporarily omit unrealistic ones)

BONUS:

- prep your surroundings by setting up what you need to start activities (decrease steps)
- set barriers for unwanted desserts (increase steps)
          '''
        ),

        Text(
          '''
          physical rest,
mental rest,
emotional rest,
social rest,
sensory rest,
identity rest (its actually called "spiritual" but the term doesnt fit me),
creative rest '''
        ),

        Text("Equilibrio, Homeostase. Not "
            "necessarily stopping to do something, "
            "but doing in contrast to what you already have "
            "to do in your day-to-day. Do it without pressure, "
            "so it can be satisfying. ")
      ]
    );
  }
}
