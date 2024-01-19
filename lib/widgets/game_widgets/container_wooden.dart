import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';

class WoodenContainer extends StatelessWidget {
  final Widget child;

  const WoodenContainer({Key? key, required this.child,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: CustomColors.lightBlue,
          width: 2,
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/wood_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
