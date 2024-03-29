import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';


class LevelButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLocked;

  const LevelButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isLocked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth / 1.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: const BorderSide(
              color: CustomColors.lightBlue,
              width: 2,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.info_rounded,
                color: CustomColors.darkBlue,
              ),

              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.darkBlue,
                ),
              ),

              Icon(
                Icons.lock,
                color: isLocked ? CustomColors.darkBlue : Colors.white,
              )

            ],
          ),
        ),
      ),
    );
  }
}
