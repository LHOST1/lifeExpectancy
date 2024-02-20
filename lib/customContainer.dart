import 'package:flutter/material.dart';

class customContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;
  customContainer({super.key, this.renk = Colors.white, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(12),
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: renk,
      ),
    );
  }
}
