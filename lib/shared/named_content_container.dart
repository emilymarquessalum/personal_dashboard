import 'package:flutter/material.dart';
import 'package:personal_dashboard/shared/themes/container_theme.dart';

class NamedContentContainer extends StatefulWidget {
  final Color? backgroundColor;
  final String name;
  final Widget child;
  final Widget? actions;
  final bool canExpand;

  const NamedContentContainer({
    super.key,
    this.backgroundColor,
    required this.child,
    required this.name,
    this.actions,
    this.canExpand = true,
  });

  @override
  State<NamedContentContainer> createState() => _NamedContentContainerState();
}

class _NamedContentContainerState extends State<NamedContentContainer> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        this.widget.backgroundColor ?? Theme.of(context).colorScheme.secondary;

    return Column(
      children: [
        Container(
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: widget.canExpand == false
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: widget.canExpand == false
                        ? EdgeInsets.zero
                        : const EdgeInsets.only(left: 16.0),
                    child: Text(
                      widget.name,
                      textAlign: widget.canExpand == false
                          ? TextAlign.center
                          : TextAlign.start,
                    ),
                  ),
                ),
                widget.canExpand == false
                    ? Container()
                    : Expanded(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Icon(isExpanded
                                ? Icons.circle
                                : Icons.circle_outlined)),
                      ),
                widget.canExpand == false && widget.actions == null
                    ? Container()
                    : Expanded(child: widget.actions ?? Container()),
              ],
            ),
          ),
        ),
        Container(
          decoration: ContainerTheme.commonContainerDecoration(context,
              color: backgroundColor),
          child: isExpanded ? widget.child : Container(),
        ),
      ],
    );
  }
}
