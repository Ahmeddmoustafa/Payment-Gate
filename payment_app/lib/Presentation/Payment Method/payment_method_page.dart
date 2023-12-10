import 'package:flutter/material.dart';
import 'package:payment_app/Models/payment_gate_model.dart';
import 'package:payment_app/Models/payment_method_model.dart';
import 'package:payment_app/Presentation/Home/history_list.dart';
import 'package:payment_app/Presentation/Payment%20Method/payment_method.dart';
import 'package:payment_app/Resources/Managers/colors_manager.dart';
import 'package:payment_app/Resources/Managers/values_manager.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "PayMob",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.notifications,
              color: ColorManager.Golden,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s10, vertical: AppSize.s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please The Payment Method.",
                style: textTheme.displayLarge,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppSize.s10),
                child: PaymentMethod(
                  paymentMethod: VisaModel(),
                ),
              ),
              Text(
                "Account History",
                style: textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              const History(),
            ],
          ),
        ),
      ),
    );
  }
}
