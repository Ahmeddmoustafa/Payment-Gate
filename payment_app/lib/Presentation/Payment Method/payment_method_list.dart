import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Cubit/payment_cubit.dart';
import 'package:payment_app/Presentation/Payment%20Method/payment_method.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({super.key});

  @override
  State<PaymentMethodList> createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return SizedBox(
          height: height * 0.2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.paymentMethods.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  right: AppSize.s10,
                ),
                child: PaymentMethod(index: index),
              );
            },
          ),
        );
      },
    );
  }
}
