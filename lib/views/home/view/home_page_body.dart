import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:common_extensions/extensions/ui/for_widget.dart';
import 'package:flutter/material.dart';

import '../page_structures/widgets/page_structure_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          children: [
            //    Spacer(),

            PageStructureView(),



              //DinosaurSpeciesPickPopup(),


            //Spacer(),
          ],
        ),
      ),
    );
  }
}
