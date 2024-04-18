import 'package:common_extensions/extensions/ui/for_build_context.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      child: Image.asset(
        "lib/assets/background/black_background.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
