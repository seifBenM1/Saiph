import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysaiph/Screens/QuizCultureGeneral/controller/quiz_controller.dart';



class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);
  final controller = Get.find<QuizController2>();
  @override
  Widget build(BuildContext context) {
    return Obx(
          () => SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - (controller.sec.value / 15),

              backgroundColor: Colors.grey,
              strokeWidth: 8,
            ),
            Center(
              child: Text(
                '${controller.sec.value}',

                style: TextStyle(color:Colors.white,fontSize: 20)




              ),
            ),
          ],
        ),
      ),
    );
  }
}
