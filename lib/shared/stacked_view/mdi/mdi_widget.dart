


import 'package:flutter/material.dart';
import 'package:personal_dashboard/shared/stacked_view/stacked_view_controller.dart';
import 'package:provider/provider.dart';


class MDIWindowWidget extends StatefulWidget {
  final String title;
  final Widget? child;

  final double? height;


  const MDIWindowWidget({super.key, required this.title, this.child,
  this.height,});



  @override
  _MDIWindowWidgetState createState() => _MDIWindowWidgetState();
}

class _MDIWindowWidgetState extends State<MDIWindowWidget> {
  late Offset position;
  late Size size;

  Offset dragStartPoint = Offset(0, 0);

  @override
  void initState() {
    super.initState();
    position = Offset(50.0, 50.0);
    size = Size(200.0,
        widget.height ??
        150.0);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanDown: (details) {
          // Store the starting point when the user taps on the window
          dragStartPoint = details.globalPosition;
        },
        child: Draggable(
          feedback: Container(
            width: size.width,
            height: size.height,
            color: Colors.blue.withOpacity(0.5),
          ),
          childWhenDragging: Container(),
          onDragUpdate: (details) {
            if(!mounted) {
              return;
            }
              Offset difference = details.globalPosition - dragStartPoint;
              position += difference;
              dragStartPoint = details.globalPosition;

          },
          onDraggableCanceled: (velocity, offset) {
            if(!mounted) {
              return;
            }
            setState(() {


            //  Offset difference = offset - dragStartPoint;

              //position += difference;
              //velocity.pixelsPerSecond;
            });
          },
          child: Container(


            child: Material(
              elevation: 4.0,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.white),
                            onPressed: (){
                              if(context.read<StackedViewController>().onRemove == null) {
                                return;
                              }
                              context.read<StackedViewController>().onRemove!();
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: widget.child ?? Container(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
