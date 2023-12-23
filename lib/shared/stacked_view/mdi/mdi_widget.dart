


import 'package:flutter/material.dart';

class MDIWindow {

  final String title;

  MDIWindow({
    required this.title,
  });
}

class MDIWindowWidget extends StatefulWidget {
  final String title;
  final VoidCallback onClose;

  const MDIWindowWidget({super.key, required this.title, required this.onClose});



  @override
  _MDIWindowWidgetState createState() => _MDIWindowWidgetState();
}

class _MDIWindowWidgetState extends State<MDIWindowWidget> {
  late Offset position;
  late Size size;

  @override
  void initState() {
    super.initState();
    position = Offset(50.0, 50.0);
    size = Size(200.0, 150.0);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        feedback: Container(
          width: size.width,
          height: size.height,
          color: Colors.blue.withOpacity(0.5),
        ),
        childWhenDragging: Container(),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
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
                          onPressed: widget.onClose,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Content goes here'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
