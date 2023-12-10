import 'package:payment_app/Models/payment_method_model.dart';
import 'package:payment_app/Resources/Managers/assets_manager.dart';

abstract class PaymentGateModel {
  final String paymentName;
  final String image;
  final String id;
  PaymentGateModel({
    required this.id,
    required this.image,
    required this.paymentName,
  });
}

class PaymobGatewayModel extends PaymentGateModel {
  final List<PaymentMethodModel> methods = [
    VisaModel(),
    WalletModel(),
  ];

  PaymobGatewayModel({
    super.id = '1',
    super.image = AssetsManager.paymobImage,
    super.paymentName = "Paymob",
  });
}

class PaypalGatewayModel extends PaymentGateModel {
  final List<PaymentMethodModel> methods = [
    VisaModel(),
  ];

  PaypalGatewayModel({
    super.id = '1',
    super.paymentName = "Paypal",
    super.image = AssetsManager.paypalImage,
  });
}

class StripeGatewayModel extends PaymentGateModel {
  final List<PaymentMethodModel> methods = [
    VisaModel(),
  ];

  StripeGatewayModel({
    super.id = '1',
    super.paymentName = "Stripe",
    super.image = AssetsManager.stripeImage,
  });
}
