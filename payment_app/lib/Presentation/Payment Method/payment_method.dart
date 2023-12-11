import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Cubit/payment_cubit.dart';
import 'package:payment_app/Models/payment_method_model.dart';
import 'package:payment_app/Resources/Managers/colors_manager.dart';
import 'package:payment_app/Resources/Managers/routes_manager.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class PaymentMethod extends StatelessWidget {
  final int index;
  const PaymentMethod({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    final PaymentCubit paymentcubit = context.read<PaymentCubit>();

    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            paymentcubit.selectPaymentMethod(state.paymentMethods[index]);
            paymentcubit.pay(500);
            print(paymentcubit.selectedGate.paymentName);
            Navigator.pushNamed(context, Routes.processingRoute,
                arguments: paymentcubit.selectedGate);
          },
          child: Container(
            height: height * 0.2,
            width: width * 0.3,
            decoration: BoxDecoration(
                border: Border.all(color: ColorManager.Black),
                borderRadius: BorderRadius.circular(AppSize.s10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    state.paymentMethods[index].methodImage,
                  ),
                )),
            // child: Center(
            //   child: Text(
            //     "Pay With ${state.paymentMethods[index].methodName}",
            //     style: textTheme.displaySmall,
            //   ),
            // ),
          ),
        );
      },
    );
  }
}
