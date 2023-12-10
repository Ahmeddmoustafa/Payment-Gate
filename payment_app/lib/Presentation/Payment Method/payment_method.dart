import 'package:flutter/material.dart';
import 'package:payment_app/Models/payment_method_model.dart';
import 'package:payment_app/Resources/Managers/assets_manager.dart';
import 'package:payment_app/Resources/Managers/colors_manager.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class PaymentMethod extends StatelessWidget {
  final PaymentMethodModel paymentMethod;
  const PaymentMethod({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: height * 0.2,
      width: width * 0.3,
      decoration: BoxDecoration(
        color: ColorManager.LightSilver,
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      child: Center(
        child: Text("Pay With ${paymentMethod.methodName}"),
      ),
    );
  }
}
