import 'package:flutter/material.dart';
import 'package:payment_app/Resources/Managers/assets_manager.dart';
import 'package:payment_app/Resources/Managers/colors_manager.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({
    super.key,
    required this.paymentName,
    required this.paymentImage,
    required this.paymentID,
  });
  final String paymentName;
  final Color paymentImage;
  final int paymentID;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Container(
        width: width * 0.8,
        height: height * 0.3,
        decoration: BoxDecoration(
          border: Border.all(color: ColorManager.LightSilver),
          // color: paymentImage,
          borderRadius: BorderRadius.circular(
            AppSize.s10,
          ),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(AssetsManager.stripeImage),
          ),
        ),
        // child: Center(
        //   child: Text(
        //     paymentName,
        //     style: textTheme.displaySmall,
        //   ),
        // ),
      ),
    );
  }
}
