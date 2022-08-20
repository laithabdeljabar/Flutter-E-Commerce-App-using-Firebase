import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:provider/provider.dart';

import '../../component/const.dart';
import '../checkout_repository/checkout_repository.dart';
import '../model/steps.dart';

class CheckoutStps extends StatelessWidget {
  const CheckoutStps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<CheckoutRepository>(
      builder: (context, value, child) {
        return IconStepper(
          enableNextPreviousButtons: false,
          steppingEnabled: false,
          stepRadius: 25,
          stepColor: Colors.transparent,
          activeStepColor: const Color(fontColor),
          stepReachedAnimationEffect: Curves.easeIn,
          lineLength: size.width * 0.21,
          lineColor: const Color(fontColor),
          activeStepBorderColor: const Color(fontColor),
          icons: [
            Icon(Icons.location_on,
                color: value.selectedStep == Steps.location.index
                    ? Colors.white
                    : const Color(fontColor)),
            Icon(Icons.info,
                color: value.selectedStep == Steps.information.index
                    ? Colors.white
                    : const Color(fontColor)),
            Icon(Icons.shopify,
                color: value.selectedStep == Steps.package.index
                    ? Colors.white
                    : const Color(fontColor)),
          ],
          activeStep: value.selectedStep,
          onStepReached: (step) {
            value.selectStep(step);
          },
        );
      },
    );
  }
}
