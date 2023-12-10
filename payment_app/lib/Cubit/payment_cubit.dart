import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Models/payment_gate_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final List<PaymentGateModel> paymentGates = [
    PaypalGatewayModel(),
    PaymobGatewayModel(),
    StripeGatewayModel(),
  ];
  late PaymentGateModel selectedGate;
  PaymentCubit() : super(PaymentInitial());
}
