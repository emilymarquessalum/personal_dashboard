


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/dinosaur/models/dinosaur_species.dart';
import 'package:styled_widget/styled_widget.dart';

class DinosaurSpeciesCard extends StatelessWidget {
  final DinosaurSpecies species;
  const DinosaurSpeciesCard({super.key,
  required this.species,});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Column(
        children:[

          Container(
            height: 160,
            child:    (species.image.item as Widget).clipOval(),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(species.speciesName),
          ),
        ]
      ),
    );
  }
}
