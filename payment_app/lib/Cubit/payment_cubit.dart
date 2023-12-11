import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Models/payment_gate_model.dart';
import 'package:payment_app/Models/payment_method_model.dart';
import 'package:payment_app/Payment%20Managers/stripe_manager.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  // final PaymentManager _paymentManager = PaymentManager();
  final StripeManager _stripeManager = StripeManager();

  final List<PaymentGateModel> paymentGates = [
    PaymobGatewayModel(),
    PaypalGatewayModel(),
    StripeGatewayModel(),
  ];
  final List<PaymentMethodModel> _paymentMethods = [
    VisaModel(),
    WalletModel(),
  ];
  late PaymentGateModel selectedGate;
  late PaymentMethodModel selectedMethod;
  PaymentCubit() : super(const PaymentInitial(paymentMethods: []));

  void selectPaymentGate(int index) {
    emit(const PaymentInitial(paymentMethods: []));
    selectedGate = paymentGates[index];
    switch (selectedGate.runtimeType) {
      case StripeGatewayModel:
        emit(PaymentSelected(paymentMethods: [_paymentMethods[0]]));
      case PaymobGatewayModel:
        emit(PaymentSelected(paymentMethods: _paymentMethods));
      case PaypalGatewayModel:
        emit(PaymentSelected(paymentMethods: [_paymentMethods[0]]));
      default:
        emit(const PaymentInitial(paymentMethods: []));
    }
  }

  void selectPaymentMethod(PaymentMethodModel method) {
    switch (method.runtimeType) {
      case VisaModel:
        selectedMethod = VisaModel();
      case WalletModel:
        selectedMethod = WalletModel();
      default:
        emit(const PaymentInitial(paymentMethods: []));
    }
  }

  void pay(int amount) {
    switch (selectedGate.runtimeType) {
      case StripeGatewayModel:
        switch (selectedMethod.runtimeType) {
          case VisaModel:
            _visaStripePayment();
        }
      case PaymobGatewayModel:
        switch (selectedMethod.runtimeType) {
          case VisaModel:
            _visaPaymobPayment();
          case WalletModel:
            _walletPaymobPayment();
        }
      case PaypalGatewayModel:
        switch (selectedMethod.runtimeType) {
          case VisaModel:
            _visaPaypalPayment();
        }
    }
  }

  /// ******************* ALL STRIPE PAYMENTS ****************/////////////////////// *
  void _visaStripePayment() async {
    print("Pay with Stripe visa method");
    await _stripeManager.pay(20, "EGP");
  }

  /// ******************* ALL PayPal PAYMENTS ****************/////////////////////// *
  void _visaPaypalPayment() {
    print("Pay with Paypal visa method");
  }

  /// ******************* ALL PayMob PAYMENTS ****************/////////////////////// *
  void _visaPaymobPayment() {
    print("Pay with Paymob visa method");
    // final token = await _paymentManager.payWithVisa(1, "EGP");
    //   launchUrl(Uri.parse(
    //       "https://accept.paymob.com/api/acceptance/iframes/804240?payment_token=$token"));
  }

  void _walletPaymobPayment() {
    print("Pay with Paymob wallet method");
    //   final url = await _paymentManager.payWithWallet(1, "EGP");
    //   launchUrl(Uri.parse(url));
  }
}
