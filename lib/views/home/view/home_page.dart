


import 'package:personal_dashboard/views/home/view/home_page_body.dart';
import 'package:personal_dashboard/views/mood/models/mood_record.dart';
import 'package:personal_dashboard/views/mood/widgets/mood_card.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
//import '../../../shared_widgets/mdi/mdi_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late FormGroup form;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    form = FormGroup({
      'url': FormControl<String>(validators: [Validators.required]),
      'title': FormControl<String>(validators: [Validators.required]),

    });

  }

  List<Widget> stackedWidgets = [];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        actions: [
          InkWell(
            onTap: (){

              setState(() {
/*
                stackedWidgets.add(
                    MDIWindowWidget(
                      title: 'Teste', onClose: () {

                    },

                    )
                );*/
              });
            },
            child: MoodCardIcon(
              moodType: MoodType.good,
              color: Colors.green,
            ),
          )
        ],
      ),
        body: Stack(
          children: [

            SingleChildScrollView(child: HomePageBody(form: form)),
            ...stackedWidgets,
          ],
        )
    );
  }
}

