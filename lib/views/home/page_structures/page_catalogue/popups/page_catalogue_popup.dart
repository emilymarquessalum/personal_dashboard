


import 'package:flutter/material.dart';
import 'package:personal_dashboard/views/home/page_structures/bloc/page_structures_bloc.dart';
import 'package:personal_dashboard/views/home/page_structures/page_catalogue/widget/page_catalogue_view.dart';

class PageCataloguePopup extends StatelessWidget {

  final PageStructuresBloc bloc;

  const PageCataloguePopup({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PageCatalogueView(
        bloc: bloc,
      )
    );
  }
}
