import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class HomeQuillEditor extends StatefulWidget {
  const HomeQuillEditor({
    super.key,
  });

  @override
  State<HomeQuillEditor> createState() => _HomeQuillEditorState();
}

class _HomeQuillEditorState extends State<HomeQuillEditor> {

  QuillController _controller = QuillController.basic();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      child: Column(
        children: [
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('pt'),
              ),
            ),
          ),
          Expanded(
            child: QuillEditor.basic(
              configurations: QuillEditorConfigurations(
                controller: _controller,
                readOnly: false,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('pt'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
