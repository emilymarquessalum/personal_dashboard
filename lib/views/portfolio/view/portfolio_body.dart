

import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/material.dart';

class PortfolioBody extends StatelessWidget {
  const PortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BrainSkillsContainer();
  }
}

class BrainSkillsContainer extends StatelessWidget {
  const BrainSkillsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.8,
      height: 250,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
              "lib/assets/images/brain_sillhuete.png",
         ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Text("Frontend"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Projects"),
                      SizedBox(
                        width: 12,
                      ),
                      Text("Coding"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Engineering"),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Neurotechnology"),
                  ],
                ),
                Text("Productivity"),
              ],
            ),
          )
        ]
      ),
    );
  }
}
